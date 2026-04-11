part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState({
    @Default(InitialState()) StateStatus status,
    @Default([]) List<LocationEntity> locations,
    TargetLocationEntity? targetLocation,
    @Default(20) int filterNumber,
  }) = _HomePageState;

  @override
  StateStatus get status => throw UnimplementedError();

  @override
  List<LocationEntity> get locations => throw UnimplementedError();

  @override
  TargetLocationEntity? get targetLocation => throw UnimplementedError();

  @override
  int get filterNumber => throw UnimplementedError();
}
