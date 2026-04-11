// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState {

 StateStatus get status; List<LocationEntity> get locations; TargetLocationEntity? get targetLocation; int get filterNumber;
/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageStateCopyWith<HomePageState> get copyWith => _$HomePageStateCopyWithImpl<HomePageState>(this as HomePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.targetLocation, targetLocation) || other.targetLocation == targetLocation)&&(identical(other.filterNumber, filterNumber) || other.filterNumber == filterNumber));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(locations),targetLocation,filterNumber);

@override
String toString() {
  return 'HomePageState(status: $status, locations: $locations, targetLocation: $targetLocation, filterNumber: $filterNumber)';
}


}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res>  {
  factory $HomePageStateCopyWith(HomePageState value, $Res Function(HomePageState) _then) = _$HomePageStateCopyWithImpl;
@useResult
$Res call({
 StateStatus status, List<LocationEntity> locations, TargetLocationEntity? targetLocation, int filterNumber
});




}
/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? locations = null,Object? targetLocation = freezed,Object? filterNumber = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,targetLocation: freezed == targetLocation ? _self.targetLocation : targetLocation // ignore: cast_nullable_to_non_nullable
as TargetLocationEntity?,filterNumber: null == filterNumber ? _self.filterNumber : filterNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomePageState].
extension HomePageStatePatterns on HomePageState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePageState value)  $default,){
final _that = this;
switch (_that) {
case _HomePageState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePageState value)?  $default,){
final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StateStatus status,  List<LocationEntity> locations,  TargetLocationEntity? targetLocation,  int filterNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.status,_that.locations,_that.targetLocation,_that.filterNumber);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StateStatus status,  List<LocationEntity> locations,  TargetLocationEntity? targetLocation,  int filterNumber)  $default,) {final _that = this;
switch (_that) {
case _HomePageState():
return $default(_that.status,_that.locations,_that.targetLocation,_that.filterNumber);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StateStatus status,  List<LocationEntity> locations,  TargetLocationEntity? targetLocation,  int filterNumber)?  $default,) {final _that = this;
switch (_that) {
case _HomePageState() when $default != null:
return $default(_that.status,_that.locations,_that.targetLocation,_that.filterNumber);case _:
  return null;

}
}

}

/// @nodoc


class _HomePageState extends HomePageState {
  const _HomePageState({this.status = const InitialState(), final  List<LocationEntity> locations = const [], this.targetLocation, this.filterNumber = 20}): _locations = locations,super._();
  

@override@JsonKey() final  StateStatus status;
 final  List<LocationEntity> _locations;
@override@JsonKey() List<LocationEntity> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

@override final  TargetLocationEntity? targetLocation;
@override@JsonKey() final  int filterNumber;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageStateCopyWith<_HomePageState> get copyWith => __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.targetLocation, targetLocation) || other.targetLocation == targetLocation)&&(identical(other.filterNumber, filterNumber) || other.filterNumber == filterNumber));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_locations),targetLocation,filterNumber);

@override
String toString() {
  return 'HomePageState(status: $status, locations: $locations, targetLocation: $targetLocation, filterNumber: $filterNumber)';
}


}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(_HomePageState value, $Res Function(_HomePageState) _then) = __$HomePageStateCopyWithImpl;
@override @useResult
$Res call({
 StateStatus status, List<LocationEntity> locations, TargetLocationEntity? targetLocation, int filterNumber
});




}
/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? locations = null,Object? targetLocation = freezed,Object? filterNumber = null,}) {
  return _then(_HomePageState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StateStatus,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<LocationEntity>,targetLocation: freezed == targetLocation ? _self.targetLocation : targetLocation // ignore: cast_nullable_to_non_nullable
as TargetLocationEntity?,filterNumber: null == filterNumber ? _self.filterNumber : filterNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
