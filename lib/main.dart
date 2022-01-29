import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycalculator/business_logic/Shared/shared.dart';
import 'package:mycalculator/business_logic/bloc/cubits/calculator_cubit/calculator_cubit.dart';
import 'package:mycalculator/ui/screens/calculator_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'business_logic/bloc/cubits/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Shared.sharedPreferences = await SharedPreferences.getInstance();
  bool isDark = Shared.sharedPreferences?.getBool('isDark') ?? true;
  runApp(
    BlocProvider(
      create: (context) =>
      ThemeCubit()
        ..initTheme(isDark),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor:
            state is ThemeLight ? Colors.white : const Color(0xFF24242E),
            fontFamily: 'Helvetica',
            colorScheme: state is ThemeLight
                ? ColorScheme.light(
              brightness: Brightness.light,
              primary: Colors.redAccent,
              secondary: Colors.greenAccent,
              onPrimary: Colors.black,
              primaryVariant: Colors.grey[50]!,
              secondaryVariant: Colors.grey[100]!,
            )
                : const ColorScheme.dark(
              brightness: Brightness.dark,
              primary: Colors.redAccent,
              secondary: Colors.greenAccent,
              onPrimary: Colors.white,
              primaryVariant: Color(0xFF2D2D39),
              secondaryVariant: Color(0xFF2A2A34),
            ),
          ),
          home: BlocProvider(
            create: (context) => CalculatorCubit(),
            child: const CalculatorScreen(),
          ),
        );
      },
    );
  }
}
