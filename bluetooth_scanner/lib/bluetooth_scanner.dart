import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_scanner.freezed.dart';
part 'bluetooth_scanner.g.dart';

final _flutterBlue = FlutterBluePlus.instance;

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

  BluetoothScanner() {
    _bluetoothSubscriptions.add(_flutterBlue.isScanning.listen((event) {
      state = state.copyWith(
          isScanning: event, scanResults: event ? [] : state.scanResults);
    }));
    _bluetoothSubscriptions.add(_flutterBlue.adapterState.listen((event) {
      state = state.copyWith(enabled: event == BluetoothAdapterState.on);
    }));
    _bluetoothSubscriptions.add(_flutterBlue.scanResults.listen((event) {
      for (final result in event) {
        if (_resultCache[result.device.remoteId.str] == null) {
          _resultCache[result.device.remoteId.str] = result;
          state = state.copyWith(
              scanResults: List.from(_resultCache.values, growable: false));
        }
      }
    }));
  }

  @override
  BluetoothScannerState build() {
    ref.onDispose(() {
      for (final subscription in _bluetoothSubscriptions) {
        subscription.cancel();
      }
      _resultCache.clear();
    });
    return const BluetoothScannerState();
  }

  Future startScan({Duration? timeout}) =>
      _flutterBlue.startScan(timeout: timeout);
  Future stopScan() => _flutterBlue.stopScan();
}
