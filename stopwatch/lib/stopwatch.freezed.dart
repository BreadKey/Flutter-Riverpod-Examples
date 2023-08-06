// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StopwatchState {
  bool get onRunning => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StopwatchStateCopyWith<StopwatchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopwatchStateCopyWith<$Res> {
  factory $StopwatchStateCopyWith(
          StopwatchState value, $Res Function(StopwatchState) then) =
      _$StopwatchStateCopyWithImpl<$Res, StopwatchState>;
  @useResult
  $Res call({bool onRunning, Duration duration});
}

/// @nodoc
class _$StopwatchStateCopyWithImpl<$Res, $Val extends StopwatchState>
    implements $StopwatchStateCopyWith<$Res> {
  _$StopwatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onRunning = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      onRunning: null == onRunning
          ? _value.onRunning
          : onRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StopwatchStateCopyWith<$Res>
    implements $StopwatchStateCopyWith<$Res> {
  factory _$$_StopwatchStateCopyWith(
          _$_StopwatchState value, $Res Function(_$_StopwatchState) then) =
      __$$_StopwatchStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool onRunning, Duration duration});
}

/// @nodoc
class __$$_StopwatchStateCopyWithImpl<$Res>
    extends _$StopwatchStateCopyWithImpl<$Res, _$_StopwatchState>
    implements _$$_StopwatchStateCopyWith<$Res> {
  __$$_StopwatchStateCopyWithImpl(
      _$_StopwatchState _value, $Res Function(_$_StopwatchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onRunning = null,
    Object? duration = null,
  }) {
    return _then(_$_StopwatchState(
      onRunning: null == onRunning
          ? _value.onRunning
          : onRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_StopwatchState implements _StopwatchState {
  const _$_StopwatchState(
      {this.onRunning = false, this.duration = Duration.zero});

  @override
  @JsonKey()
  final bool onRunning;
  @override
  @JsonKey()
  final Duration duration;

  @override
  String toString() {
    return 'StopwatchState(onRunning: $onRunning, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StopwatchState &&
            (identical(other.onRunning, onRunning) ||
                other.onRunning == onRunning) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onRunning, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StopwatchStateCopyWith<_$_StopwatchState> get copyWith =>
      __$$_StopwatchStateCopyWithImpl<_$_StopwatchState>(this, _$identity);
}

abstract class _StopwatchState implements StopwatchState {
  const factory _StopwatchState(
      {final bool onRunning, final Duration duration}) = _$_StopwatchState;

  @override
  bool get onRunning;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_StopwatchStateCopyWith<_$_StopwatchState> get copyWith =>
      throw _privateConstructorUsedError;
}
