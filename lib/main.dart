import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dtt/home/application/home_bloc.dart';
import 'package:flutter_dtt/home/application/home_event.dart';
import 'package:flutter_dtt/home/presentation/home_screen.dart';
import 'package:flutter_dtt/information/presentation/information_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFE65541),
          onPrimary: Colors.white,
          background: Color(0xFFF7F7F7),
          surface: Color(0xFFEBEBEB),
          surfaceVariant: Color(0x33000000),
          surfaceTint: Color(0x66000000),
          onSurface: Color(0xCC000000),
        ),
        textTheme: const TextTheme(
          // Title 1
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          // Title 2
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          // Title 3
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          // Body
          bodyLarge: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          // Input
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          // Hint
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
          // Subtitle
          displayLarge: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
          // Detail
          displayMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      home: BlocProvider<HomeBloc>(
        child:  const HomeScreen(),
        create: (BuildContext context) {
          return HomeBloc()..add(LoadHomeEvent());
        },
      ),
    );
  }
}
