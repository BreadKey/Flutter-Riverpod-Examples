// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bluetooth_scanner.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isBluetoothAvailableHash() =>
    r'772305fb2234359df18ba736bec7b606580a2dba';

/// See also [isBluetoothAvailable].
@ProviderFor(isBluetoothAvailable)
final isBluetoothAvailableProvider = AutoDisposeFutureProvider<bool>.internal(
  isBluetoothAvailable,
  name: r'isBluetoothAvailableProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isBluetoothAvailableHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsBluetoothAvailableRef = AutoDisposeFutureProviderRef<bool>;
String _$bluetoothScannerHash() => r'f43f8411a56f495562bda5085bcca7274cbfb843';

/// See also [BluetoothScanner].
@ProviderFor(BluetoothScanner)
final bluetoothScannerProvider = AutoDisposeNotifierProvider<BluetoothScanner,
    BluetoothScannerState>.internal(
  BluetoothScanner.new,
  name: r'bluetoothScannerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bluetoothScannerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BluetoothScanner = AutoDisposeNotifier<BluetoothScannerState>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
