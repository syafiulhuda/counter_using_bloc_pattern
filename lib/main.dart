import 'package:bloc_counter_kuldii/app.dart';
import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Global Access
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: App(),
    );
  }
}
