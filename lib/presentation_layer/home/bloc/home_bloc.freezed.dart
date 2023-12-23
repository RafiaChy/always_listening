// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeUpdateState {
  int get counter => throw _privateConstructorUsedError;
  List<String> get transcripts => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUpdateStateCopyWith<HomeUpdateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUpdateStateCopyWith<$Res> {
  factory $HomeUpdateStateCopyWith(
          HomeUpdateState value, $Res Function(HomeUpdateState) then) =
      _$HomeUpdateStateCopyWithImpl<$Res, HomeUpdateState>;
  @useResult
  $Res call(
      {int counter,
      List<String> transcripts,
      bool isError,
      String errorMessage});
}

/// @nodoc
class _$HomeUpdateStateCopyWithImpl<$Res, $Val extends HomeUpdateState>
    implements $HomeUpdateStateCopyWith<$Res> {
  _$HomeUpdateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? transcripts = null,
    Object? isError = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      transcripts: null == transcripts
          ? _value.transcripts
          : transcripts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeUpdateStateImplCopyWith<$Res>
    implements $HomeUpdateStateCopyWith<$Res> {
  factory _$$HomeUpdateStateImplCopyWith(_$HomeUpdateStateImpl value,
          $Res Function(_$HomeUpdateStateImpl) then) =
      __$$HomeUpdateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int counter,
      List<String> transcripts,
      bool isError,
      String errorMessage});
}

/// @nodoc
class __$$HomeUpdateStateImplCopyWithImpl<$Res>
    extends _$HomeUpdateStateCopyWithImpl<$Res, _$HomeUpdateStateImpl>
    implements _$$HomeUpdateStateImplCopyWith<$Res> {
  __$$HomeUpdateStateImplCopyWithImpl(
      _$HomeUpdateStateImpl _value, $Res Function(_$HomeUpdateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = null,
    Object? transcripts = null,
    Object? isError = null,
    Object? errorMessage = null,
  }) {
    return _then(_$HomeUpdateStateImpl(
      counter: null == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      transcripts: null == transcripts
          ? _value._transcripts
          : transcripts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeUpdateStateImpl implements _HomeUpdateState {
  const _$HomeUpdateStateImpl(
      {required this.counter,
      required final List<String> transcripts,
      required this.isError,
      required this.errorMessage})
      : _transcripts = transcripts;

  @override
  final int counter;
  final List<String> _transcripts;
  @override
  List<String> get transcripts {
    if (_transcripts is EqualUnmodifiableListView) return _transcripts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transcripts);
  }

  @override
  final bool isError;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'HomeUpdateState(counter: $counter, transcripts: $transcripts, isError: $isError, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUpdateStateImpl &&
            (identical(other.counter, counter) || other.counter == counter) &&
            const DeepCollectionEquality()
                .equals(other._transcripts, _transcripts) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, counter,
      const DeepCollectionEquality().hash(_transcripts), isError, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeUpdateStateImplCopyWith<_$HomeUpdateStateImpl> get copyWith =>
      __$$HomeUpdateStateImplCopyWithImpl<_$HomeUpdateStateImpl>(
          this, _$identity);
}

abstract class _HomeUpdateState implements HomeUpdateState {
  const factory _HomeUpdateState(
      {required final int counter,
      required final List<String> transcripts,
      required final bool isError,
      required final String errorMessage}) = _$HomeUpdateStateImpl;

  @override
  int get counter;
  @override
  List<String> get transcripts;
  @override
  bool get isError;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$HomeUpdateStateImplCopyWith<_$HomeUpdateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
