// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_collection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationCollectionResponse {

 int get id; double get lat; double get lng; DateTime get timestamp; double get distance;
/// Create a copy of LocationCollectionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCollectionResponseCopyWith<LocationCollectionResponse> get copyWith => _$LocationCollectionResponseCopyWithImpl<LocationCollectionResponse>(this as LocationCollectionResponse, _$identity);

  /// Serializes this LocationCollectionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationCollectionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lat,lng,timestamp,distance);

@override
String toString() {
  return 'LocationCollectionResponse(id: $id, lat: $lat, lng: $lng, timestamp: $timestamp, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $LocationCollectionResponseCopyWith<$Res>  {
  factory $LocationCollectionResponseCopyWith(LocationCollectionResponse value, $Res Function(LocationCollectionResponse) _then) = _$LocationCollectionResponseCopyWithImpl;
@useResult
$Res call({
 int id, double lat, double lng, DateTime timestamp, double distance
});




}
/// @nodoc
class _$LocationCollectionResponseCopyWithImpl<$Res>
    implements $LocationCollectionResponseCopyWith<$Res> {
  _$LocationCollectionResponseCopyWithImpl(this._self, this._then);

  final LocationCollectionResponse _self;
  final $Res Function(LocationCollectionResponse) _then;

/// Create a copy of LocationCollectionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lat = null,Object? lng = null,Object? timestamp = null,Object? distance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationCollectionResponse].
extension LocationCollectionResponsePatterns on LocationCollectionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationCollectionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationCollectionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationCollectionResponse value)  $default,){
final _that = this;
switch (_that) {
case _LocationCollectionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationCollectionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LocationCollectionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  double lat,  double lng,  DateTime timestamp,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationCollectionResponse() when $default != null:
return $default(_that.id,_that.lat,_that.lng,_that.timestamp,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  double lat,  double lng,  DateTime timestamp,  double distance)  $default,) {final _that = this;
switch (_that) {
case _LocationCollectionResponse():
return $default(_that.id,_that.lat,_that.lng,_that.timestamp,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  double lat,  double lng,  DateTime timestamp,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _LocationCollectionResponse() when $default != null:
return $default(_that.id,_that.lat,_that.lng,_that.timestamp,_that.distance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationCollectionResponse extends LocationCollectionResponse {
  const _LocationCollectionResponse({required this.id, required this.lat, required this.lng, required this.timestamp, required this.distance}): super._();
  factory _LocationCollectionResponse.fromJson(Map<String, dynamic> json) => _$LocationCollectionResponseFromJson(json);

@override final  int id;
@override final  double lat;
@override final  double lng;
@override final  DateTime timestamp;
@override final  double distance;

/// Create a copy of LocationCollectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCollectionResponseCopyWith<_LocationCollectionResponse> get copyWith => __$LocationCollectionResponseCopyWithImpl<_LocationCollectionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationCollectionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationCollectionResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.distance, distance) || other.distance == distance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,lat,lng,timestamp,distance);

@override
String toString() {
  return 'LocationCollectionResponse(id: $id, lat: $lat, lng: $lng, timestamp: $timestamp, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$LocationCollectionResponseCopyWith<$Res> implements $LocationCollectionResponseCopyWith<$Res> {
  factory _$LocationCollectionResponseCopyWith(_LocationCollectionResponse value, $Res Function(_LocationCollectionResponse) _then) = __$LocationCollectionResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, double lat, double lng, DateTime timestamp, double distance
});




}
/// @nodoc
class __$LocationCollectionResponseCopyWithImpl<$Res>
    implements _$LocationCollectionResponseCopyWith<$Res> {
  __$LocationCollectionResponseCopyWithImpl(this._self, this._then);

  final _LocationCollectionResponse _self;
  final $Res Function(_LocationCollectionResponse) _then;

/// Create a copy of LocationCollectionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lat = null,Object? lng = null,Object? timestamp = null,Object? distance = null,}) {
  return _then(_LocationCollectionResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
