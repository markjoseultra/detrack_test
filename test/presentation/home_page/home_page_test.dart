import 'package:bloc_test/bloc_test.dart';
import 'package:detrack_test/core/resources/values/state_status.dart';
import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/location_error.dart';
import 'package:detrack_test/core/utils/helpers/errors/network_error.dart';
import 'package:detrack_test/domain/entities/location_entity.dart';
import 'package:detrack_test/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:detrack_test/presentation/pages/home_page/home_page.dart';
import 'package:detrack_test/presentation/widgets/readings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/resources/dependency_mocks/cubit_mocks.dart';

void main() {
  late MockHomePageCubit mockHomePageCubit;

  setUp(() {
    mockHomePageCubit = MockHomePageCubit();
  });

  Widget buildTestWidget() {
    return MultiBlocProvider(
      providers: [BlocProvider<HomePageCubit>(create: (context) => mockHomePageCubit)],
      child: MaterialApp(home: HomePage()),
    );
  }

  group('Render Test', () {
    testWidgets('Initial render test', (tester) async {
      when(() => mockHomePageCubit.state).thenReturn(const HomePageState());

      await tester.pumpWidget(buildTestWidget());

      expect(find.text(Strings.pressStartTracking), findsOneWidget);

      expect(find.text(Strings.toStartRecording), findsOneWidget);

      expect(find.text(Strings.startTracking), findsOneWidget);
    });

    testWidgets('Should render readings if not empty', (tester) async {
      final state = HomePageState(
        locations: [
          LocationEntity(id: 1, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(2026)),
          LocationEntity(id: 2, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(2026)),
          LocationEntity(id: 3, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(2026)),
          LocationEntity(id: 4, lng: 1.0, lat: 1.0, distance: 1.0, timestamp: DateTime(2026)),
        ],
      );

      when(() => mockHomePageCubit.state).thenReturn(state);

      await tester.pumpWidget(buildTestWidget());

      expect(find.byType(ReadingsItem), findsAtLeastNWidgets(4));
    });
  });

  group('Error Test', () {
    testWidgets('Should display network error', (tester) async {
      final error = NetworkError();

      whenListen(
        mockHomePageCubit,
        Stream.fromIterable([HomePageState(status: FailedState(error))]),
        initialState: HomePageState(status: FailedState(error)),
      );

      await tester.pumpWidget(buildTestWidget());

      await tester.pumpAndSettle();

      expect(find.text(Strings.networkError), findsOneWidget);
    });

    testWidgets('Should display LocationServiceDisabledError error', (tester) async {
      final error = LocationServiceDisabledError();

      whenListen(
        mockHomePageCubit,
        Stream.fromIterable([HomePageState(status: FailedState(error))]),
        initialState: HomePageState(status: FailedState(error)),
      );

      await tester.pumpWidget(buildTestWidget());

      await tester.pumpAndSettle();

      expect(find.text(Strings.locationServiceIsDisabled), findsOneWidget);
    });

    testWidgets('Should display LocationServiceDisabledError error', (tester) async {
      final error = LocationServiceDisabledError();

      whenListen(
        mockHomePageCubit,
        Stream.fromIterable([HomePageState(status: FailedState(error))]),
        initialState: HomePageState(status: FailedState(error)),
      );

      await tester.pumpWidget(buildTestWidget());

      await tester.pumpAndSettle();

      expect(find.text(Strings.locationServiceIsDisabled), findsOneWidget);
    });

    testWidgets('Should display LocationPermissionDeniedError error', (tester) async {
      final error = LocationPermissionDeniedError();

      whenListen(
        mockHomePageCubit,
        Stream.fromIterable([HomePageState(status: FailedState(error))]),
        initialState: HomePageState(status: FailedState(error)),
      );

      await tester.pumpWidget(buildTestWidget());

      await tester.pumpAndSettle();

      expect(find.text(Strings.locationPermissionIsDenied), findsOneWidget);
    });

    testWidgets('Should display LocationPermissionDeniedForeverError error', (tester) async {
      final error = LocationPermissionDeniedForeverError();

      whenListen(
        mockHomePageCubit,
        Stream.fromIterable([HomePageState(status: FailedState(error))]),
        initialState: HomePageState(status: FailedState(error)),
      );

      await tester.pumpWidget(buildTestWidget());

      await tester.pumpAndSettle();

      expect(find.text(Strings.locationPermissionIsDeniedForever), findsOneWidget);
    });
  });
}
