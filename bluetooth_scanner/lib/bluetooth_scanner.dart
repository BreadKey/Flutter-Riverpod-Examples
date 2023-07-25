import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_scanner.freezed.dart';
part 'bluetooth_scanner.g.dart';

@freezed
class BluetoothScannerState with _$BluetoothScannerState {
  const factory BluetoothScannerState(
      {@Default(false) bool enabled,
      @Default(false) bool isScanning,
      @Default([]) List<ScanResult> scanResults}) = _BluetoothScannerState;
}

@riverpod
class BluetoothScanner extends _$BluetoothScanner {
  final _bluetoothSubscriptions = <StreamSubscription>[];
  final _resultCache = <String, ScanResult>{};

  BluetoothScanner();

  @override
  BluetoothScannerState build() {
    _listenBluetooth();
    ref.onDispose(() {
      for (final subscription in _bluetoothSubscriptions) {
        subscription.cancel();
      }
      _bluetoothSubscriptions.clear();
      _resultCache.clear();
    });
    return const BluetoothScannerState();
  }

  void _listenBluetooth() {
    _bluetoothSubscriptions.add(FlutterBluePlus.isScanning.listen((event) {
      state = state.copyWith(
          isScanning: event, scanResults: event ? [] : state.scanResults);
    }));
    _bluetoothSubscriptions.add(FlutterBluePlus.adapterState.listen((event) {
      state = state.copyWith(enabled: event == BluetoothAdapterState.on);
    }));
    _bluetoothSubscriptions.add(FlutterBluePlus.scanResults.listen((event) {
      for (final result in event) {
        if (_resultCache[result.device.remoteId.str] == null) {
          _resultCache[result.device.remoteId.str] = result;
          state = state.copyWith(
              scanResults: List.from(_resultCache.values, growable: false));
        }
      }
    }));
  }

  Future startScan({Duration? timeout}) =>
      FlutterBluePlus.startScan(timeout: timeout);
  Future stopScan() => FlutterBluePlus.stopScan();
}
