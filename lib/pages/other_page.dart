import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:bloc_counter_kuldii/widgets/app_bar_widget.dart';
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
      appBar: AppBarWidget(
        title: "Other Page",
        onActionPressed: () {
          themeBloc.add(ThemeTooglePressed());
        },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/user");
        },
        key: const Key('counterView_nextPageAgain_floatingActionButton'),
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}
