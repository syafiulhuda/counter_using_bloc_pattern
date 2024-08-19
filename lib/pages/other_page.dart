import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Opsional jika data context tidak terbaca
    // ! Ambil context dari context yang sama dengan parent
    // CounterBloc counterBloc = context.read<CounterBloc>();

    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Other Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              themeBloc.add(ThemeTooglePressed());
            },
            icon: const Icon(Icons.theater_comedy),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          // bloc: counterBloc,
          builder: (context, state) {
            return Text(
              "$state",
              style: const TextStyle(
                fontSize: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
