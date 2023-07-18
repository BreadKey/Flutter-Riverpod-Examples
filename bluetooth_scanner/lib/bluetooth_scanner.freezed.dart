// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_scanner.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothScannerState {
  bool get enabled => throw _privateConstructorUsedError;
  bool get isScanning => throw _privateConstructorUsedError;
  List<ScanResult> get scanResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothScannerStateCopyWith<BluetoothScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothScannerStateCopyWith<$Res> {
  factory $BluetoothScannerStateCopyWith(BluetoothScannerState value,
          $Res Function(BluetoothScannerState) then) =
      _$BluetoothScannerStateCopyWithImpl<$Res, BluetoothScannerState>;
  @useResult
  $Res call({bool enabled, bool isScanning, List<ScanResult> scanResults});
}

/// @nodoc
class _$BluetoothScannerStateCopyWithImpl<$Res,
        $Val extends BluetoothScannerState>
    implements $BluetoothScannerStateCopyWith<$Res> {
  _$BluetoothScannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? isScanning = null,
    Object? scanResults = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      scanResults: null == scanResults
          ? _value.scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothScannerStateCopyWith<$Res>
    implements $BluetoothScannerStateCopyWith<$Res> {
  factory _$$_BluetoothScannerStateCopyWith(_$_BluetoothScannerState value,
          $Res Function(_$_BluetoothScannerState) then) =
      __$$_BluetoothScannerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, bool isScanning, List<ScanResult> scanResults});
}

/// @nodoc
class __$$_BluetoothScannerStateCopyWithImpl<$Res>
    extends _$BluetoothScannerStateCopyWithImpl<$Res, _$_BluetoothScannerState>
    implements _$$_BluetoothScannerStateCopyWith<$Res> {
  __$$_BluetoothScannerStateCopyWithImpl(_$_BluetoothScannerState _value,
      $Res Function(_$_BluetoothScannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? isScanning = null,
    Object? scanResults = null,
  }) {
    return _then(_$_BluetoothScannerState(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanning: null == isScanning
          ? _value.isScanning
          : isScanning // ignore: cast_nullable_to_non_nullable
              as bool,
      scanResults: null == scanResults
          ? _value._scanResults
          : scanResults // ignore: cast_nullable_to_non_nullable
              as List<ScanResult>,
    ));
  }
}

/// @nodoc

class _$_BluetoothScannerState implements _BluetoothScannerState {
  const _$_BluetoothScannerState(
      {this.enabled = false,
      this.isScanning = false,
      final List<ScanResult> scanResults = const []})
      : _scanResults = scanResults;

  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final bool isScanning;
  final List<ScanResult> _scanResults;
  @override
  @JsonKey()
  List<ScanResult> get scanResults {
    if (_scanResults is EqualUnmodifiableListView) return _scanResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scanResults);
  }

  @override
  String toString() {
    return 'BluetoothScannerState(enabled: $enabled, isScanning: $isScanning, scanResults: $scanResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothScannerState &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.isScanning, isScanning) ||
                other.isScanning == isScanning) &&
            const DeepCollectionEquality()
                .equals(other._scanResults, _scanResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enabled, isScanning,
      const DeepCollectionEquality().hash(_scanResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothScannerStateCopyWith<_$_BluetoothScannerState> get copyWith =>
      __$$_BluetoothScannerStateCopyWithImpl<_$_BluetoothScannerState>(
          this, _$identity);
}

abstract class _BluetoothScannerState implements BluetoothScannerState {
  const factory _BluetoothScannerState(
      {final bool enabled,
      final bool isScanning,
      final List<ScanResult> scanResults}) = _$_BluetoothScannerState;

  @override
  bool get enabled;
  @override
  bool get isScanning;
  @override
  List<ScanResult> get scanResults;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothScannerStateCopyWith<_$_BluetoothScannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
