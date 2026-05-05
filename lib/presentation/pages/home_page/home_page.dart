import 'dart:async';

import 'package:detrack_test/core/resources/values/state_status.dart';
import 'package:detrack_test/core/resources/values/strings.dart';
import 'package:detrack_test/core/utils/helpers/errors/location_error.dart';
import 'package:detrack_test/core/utils/helpers/errors/network_error.dart';
import 'package:detrack_test/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:detrack_test/presentation/widgets/readings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> _filters = [5, 10, 15, 20];

  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTracking({required HomePageState state}) async {
    if (!mounted) return;

    context.read<HomePageCubit>().toogleLocationTracking();

    await context.read<HomePageCubit>().getTargetLocation();

    if (state.status is ActiveState) {
      if (_timer.isActive) return _timer.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      await context.read<HomePageCubit>().trackLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detrack Test'),
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 100.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  if (state.targetLocation != null) {
                    return ListTile(
                      textColor: Color(0xFF0C447C),
                      tileColor: Color(0xFFE6F1FB),
                      leading: Icon(Icons.circle, color: Color(0xFF185FA5)),
                      title: Text(Strings.targetLocation),
                      subtitle: Text(
                        '${state.targetLocation!.targetLng}, ${state.targetLocation!.targetLat} -- Unknown location',
                      ),
                    );
                  }

                  return ListTile(
                    textColor: Color(0xFF0C447C),
                    tileColor: Color(0xFFE6F1FB),
                    leading: Icon(Icons.circle, color: Color(0xFF185FA5)),
                    title: Text(Strings.pressStartTracking),
                    subtitle: Text(Strings.toStartRecording),
                  );
                },
              ),
              BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 50.0,
                    child: ListView(
                      padding: EdgeInsets.all(5.0),
                      scrollDirection: Axis.horizontal,
                      children: _filters.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: ChoiceChip(
                            label: Text('$item readings'),
                            selected: item == state.filterNumber,
                            onSelected: (value) {
                              context.read<HomePageCubit>().setFilterNumber(filterNumber: item);
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
        child: BlocConsumer<HomePageCubit, HomePageState>(
          listener: (BuildContext context, HomePageState state) {
            if (state.status is FailedState) {
              final failedStatus = state.status as FailedState;
              if (failedStatus.error is NetworkError) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(title: Text('Error'), content: Text(Strings.networkError));
                  },
                );
              }

              if (failedStatus.error is LocationServiceDisabledError) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(title: Text('Error'), content: Text(Strings.locationServiceIsDisabled));
                  },
                );
              }
              if (failedStatus.error is LocationPermissionDeniedError) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(title: Text('Error'), content: Text(Strings.locationPermissionIsDenied));
                  },
                );
              }
              if (failedStatus.error is LocationPermissionDeniedForeverError) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(title: Text('Error'), content: Text(Strings.locationPermissionIsDeniedForever));
                  },
                );
              }
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                startTracking(state: state);
              },
              child: Text(state.status is ActiveState ? Strings.stopTracking : Strings.startTracking),
            );
          },
        ),
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state.locations.isEmpty) {}

          return SafeArea(
            child: ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                final item = state.locations[index];
                return ReadingsItem(lat: item.lat, lng: item.lng, distance: item.distance, timestamp: item.timestamp);
              },
            ),
          );
        },
      ),
    );
  }
}
