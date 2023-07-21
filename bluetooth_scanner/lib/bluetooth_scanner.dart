import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'bluetooth_scanner.freezed.dart';

final _flutterBlue = FlutterBluePlus.instance;

final scannerProvider =
    StateNotifierProvider<BluetoothScanner, BluetoothScannerState>((ref) {
  return BluetoothScanner();
});

final permissionProvier = FutureProvider((ref) async {
  final permissions = Platform.isAndroid
      ? [Permission.bluetoothConnect, Permission.bluetoothScan]
      : [Permission.bluetooth];

  final results = await permissions.request();

  for (final result in results.entries) {
    if (result.value != PermissionStatus.granted) {
      throw Exception("${result.key} permission denied");
    }
  }
});

@freezed
class BluetoothScannerState with _$BluetoothScannerState {
  const factory BluetoothScannerState(
      {@Default(false) bool enabled,
      @Default(false) bool isScanning,
      @Default([]) List<ScanResult> scanResults}) = _BluetoothScannerState;
}

class BluetoothScanner extends StateNotifier<BluetoothScannerState> {
  final _bluetoothSubscriptions = <StreamSubscription>[];
  final _resultCache = <String, ScanResult>{};

  BluetoothScanner() : super(const BluetoothScannerState()) {
    _bluetoothSubscriptions.add(_flutterBlue.isScanning.listen((event) {
      state = state.copyWith(
          isScanning: event, scanResults: event ? [] : state.scanResults);
    }));
    _bluetoothSubscriptions.add(_flutterBlue.adapterState.listen((event) {
      state = state.copyWith(enabled: event == BluetoothAdapterState.on);
    }));
    _bluetoothSubscriptions.add(_flutterBlue.scanResults.listen((event) {
      for (final result in event) {
        if (_resultCache[result.device.id.id] == null) {
          _resultCache[result.device.id.id] = result;
          state = state.copyWith(
              scanResults: List.from(_resultCache.values, growable: false));
        }
      }
    }));
  }

  @override
  void dispose() {
    for (final subscription in _bluetoothSubscriptions) {
      subscription.cancel();
    }
    _resultCache.clear();
    super.dispose();
  }

  Future startScan({Duration? timeout}) =>
      _flutterBlue.startScan(timeout: timeout);
  Future stopScan() => _flutterBlue.stopScan();
}
