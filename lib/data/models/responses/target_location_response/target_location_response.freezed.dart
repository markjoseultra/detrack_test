// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'target_location_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TargetLocationResponse {

 String get id; double get target_lat; double get target_lng;
/// Create a copy of TargetLocationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TargetLocationResponseCopyWith<TargetLocationResponse> get copyWith => _$TargetLocationResponseCopyWithImpl<TargetLocationResponse>(this as TargetLocationResponse, _$identity);

  /// Serializes this TargetLocationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TargetLocationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.target_lat, target_lat) || other.target_lat == target_lat)&&(identical(other.target_lng, target_lng) || other.target_lng == target_lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,target_lat,target_lng);

@override
String toString() {
  return 'TargetLocationResponse(id: $id, target_lat: $target_lat, target_lng: $target_lng)';
}


}

/// @nodoc
abstract mixin class $TargetLocationResponseCopyWith<$Res>  {
  factory $TargetLocationResponseCopyWith(TargetLocationResponse value, $Res Function(TargetLocationResponse) _then) = _$TargetLocationResponseCopyWithImpl;
@useResult
$Res call({
 String id, double target_lat, double target_lng
});




}
/// @nodoc
class _$TargetLocationResponseCopyWithImpl<$Res>
    implements $TargetLocationResponseCopyWith<$Res> {
  _$TargetLocationResponseCopyWithImpl(this._self, this._then);

  final TargetLocationResponse _self;
  final $Res Function(TargetLocationResponse) _then;

/// Create a copy of TargetLocationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? target_lat = null,Object? target_lng = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target_lat: null == target_lat ? _self.target_lat : target_lat // ignore: cast_nullable_to_non_nullable
as double,target_lng: null == target_lng ? _self.target_lng : target_lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TargetLocationResponse].
extension TargetLocationResponsePatterns on TargetLocationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TargetLocationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TargetLocationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TargetLocationResponse value)  $default,){
final _that = this;
switch (_that) {
case _TargetLocationResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TargetLocationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TargetLocationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double target_lat,  double target_lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TargetLocationResponse() when $default != null:
return $default(_that.id,_that.target_lat,_that.target_lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double target_lat,  double target_lng)  $default,) {final _that = this;
switch (_that) {
case _TargetLocationResponse():
return $default(_that.id,_that.target_lat,_that.target_lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double target_lat,  double target_lng)?  $default,) {final _that = this;
switch (_that) {
case _TargetLocationResponse() when $default != null:
return $default(_that.id,_that.target_lat,_that.target_lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TargetLocationResponse extends TargetLocationResponse {
  const _TargetLocationResponse({required this.id, required this.target_lat, required this.target_lng}): super._();
  factory _TargetLocationResponse.fromJson(Map<String, dynamic> json) => _$TargetLocationResponseFromJson(json);

@override final  String id;
@override final  double target_lat;
@override final  double target_lng;

/// Create a copy of TargetLocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TargetLocationResponseCopyWith<_TargetLocationResponse> get copyWith => __$TargetLocationResponseCopyWithImpl<_TargetLocationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TargetLocationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TargetLocationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.target_lat, target_lat) || other.target_lat == target_lat)&&(identical(other.target_lng, target_lng) || other.target_lng == target_lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,target_lat,target_lng);

@override
String toString() {
  return 'TargetLocationResponse(id: $id, target_lat: $target_lat, target_lng: $target_lng)';
}


}

/// @nodoc
abstract mixin class _$TargetLocationResponseCopyWith<$Res> implements $TargetLocationResponseCopyWith<$Res> {
  factory _$TargetLocationResponseCopyWith(_TargetLocationResponse value, $Res Function(_TargetLocationResponse) _then) = __$TargetLocationResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, double target_lat, double target_lng
});




}
/// @nodoc
class __$TargetLocationResponseCopyWithImpl<$Res>
    implements _$TargetLocationResponseCopyWith<$Res> {
  __$TargetLocationResponseCopyWithImpl(this._self, this._then);

  final _TargetLocationResponse _self;
  final $Res Function(_TargetLocationResponse) _then;

/// Create a copy of TargetLocationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? target_lat = null,Object? target_lng = null,}) {
  return _then(_TargetLocationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,target_lat: null == target_lat ? _self.target_lat : target_lat // ignore: cast_nullable_to_non_nullable
as double,target_lng: null == target_lng ? _self.target_lng : target_lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
