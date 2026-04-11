import 'package:detrack_test/core/di/di.dart';
import 'package:detrack_test/core/resources/values/themes/app_themes/default_theme.dart';
import 'package:detrack_test/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:detrack_test/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: BlocProvider(create: (_) => getIt<HomePageCubit>()..loadLocationHistory(), child: HomePage()),
    );
  }
}
