import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final _flutterBlue = FlutterBluePlus.instance;

final scannerProvider = StateNotifierProvider<BluetoothScanner, bool>((ref) {
  return BluetoothScanner(_flutterBlue.isScanningNow);
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

final scanResultsProvier =
    StateNotifierProvider<ScanResults, List<ScanResult>>((ref) {
  return ScanResults(const []);
});

class BluetoothScanner extends StateNotifier<bool> {
  late final StreamSubscription _isScanningSubscription;
  BluetoothScanner(super.state) {
    _isScanningSubscription = _flutterBlue.isScanning.listen((event) {
      state = event;
    });
  }

  @override
  void dispose() {
    _isScanningSubscription.cancel();
    super.dispose();
  }

  Future startScan({Duration? timeout}) =>
      _flutterBlue.startScan(timeout: timeout);
  Future stopScan() => _flutterBlue.stopScan();
}

class ScanResults extends StateNotifier<List<ScanResult>> {
  late final StreamSubscription _scanResultsSubscription;
  final _map = <String, ScanResult>{};

  ScanResults(super.state) {
    _scanResultsSubscription = _flutterBlue.scanResults.listen((results) {
      for (final result in results) {
        if (_map[result.device.id.id] == null) {
          _map[result.device.id.id] = result;
          state = _map.values.toList(growable: false);
        }
      }
    });
  }

  @override
  void dispose() {
    _scanResultsSubscription.cancel();
    super.dispose();
  }
}
