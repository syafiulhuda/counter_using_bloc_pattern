import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/pages/home_page.dart';
import 'package:bloc_counter_kuldii/pages/not_found_page.dart';
import 'package:bloc_counter_kuldii/pages/other_page.dart';
import 'package:bloc_counter_kuldii/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  // ! Untuk Generated Route
  // ! Inject semua routes dengan BlocProvider yang sama
  final CounterBloc counterBlocViaGenerateRoute = CounterBloc();

  Route onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterBlocViaGenerateRoute,
            child: const HomePage(),
          ),
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterBlocViaGenerateRoute,
            child: const OtherPage(),
          ),
        );
      case "/user":
        return MaterialPageRoute(
          builder: (context) => const UserPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterBlocViaGenerateRoute,
            child: const NotFoundPage(),
          ),
        );
    }
  }
}
