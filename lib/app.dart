// ignore_for_file: unused_import

import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:bloc_counter_kuldii/pages/home_page.dart';
import 'package:bloc_counter_kuldii/pages/other_page.dart';
import 'package:bloc_counter_kuldii/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  // ! Untuk Named Route
  // ! Inject semua routes dengan BlocProvider yang sama
  final CounterBloc counterBloc = CounterBloc();

  // ! Generated Route
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state == false ? ThemeData.dark() : ThemeData.light(),
          // ! Generated Route
          // ? Recommended
          onGenerateRoute: router.onGenereteRoute,
          // ! Named Route
          // initialRoute: "/",
          // routes: {
          //   "/": (context) => BlocProvider.value(
          //         value: counterBloc,
          //         child: const HomePage(),
          //       ),
          //   "/other": (context) => BlocProvider.value(
          //         value: counterBloc,
          //         child: const OtherPage(),
          //       ),
          // },
        );
      },
    );
  }
}
