import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bluetooth_scanner.freezed.dart';
part 'bluetooth_scanner.g.dart';

final _flutterBlue = FlutterBluePlus.instance;

@riverpod
Future<bool> isBluetoothAvailable(IsBluetoothAvailableRef ref) async {
  final permissions = Platform.isAndroid
      ? [Permission.bluetoothConnect, Permission.bluetoothScan]
      : [Permission.bluetooth];

  final results = await permissions.request();

  for (final result in results.entries) {
    if (result.value != PermissionStatus.granted) {
      return false;
    }
  }

  return true;
}

@freezed
class BluetoothScannerState with _$BluetoothScannerState {
  const factory BluetoothScannerState(
      {@Default(false) bool enabled,
      @Default(false) bool isScanning,
      @Default([]) List<ScanResult> scanResults}) = _BluetoothScannerState;
}

@riverpod
class BluetoothScanner extends AutoDisposeNotifier<BluetoothScannerState> {
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
