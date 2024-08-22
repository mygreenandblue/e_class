import 'package:eclass/core/local/auth_local.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:eclass/feature/login/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:eclass/routing/app_routes/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ThemeData customLightTheme = ThemeData(
    primaryColor: const Color(0xFF00C1B6),
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF00C1B6)),
    iconTheme: const IconThemeData(color: Color(0xFF00C1B6)));

final ThemeData customDarkTheme = ThemeData(
  primaryColor: const Color(0xFF2ACBCB),
  brightness: Brightness.dark,
  buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF2ACBCB)),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('vi', null).then((_) {
    runApp(const MyApp());
  });
  await AuthLocal.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: customLightTheme,
    );
  }
}
