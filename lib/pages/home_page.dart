import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:bloc_counter_kuldii/widgets/button_widget.dart';
import 'package:bloc_counter_kuldii/widgets/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = context.read<CounterBloc>();

    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              key: const Key('counterView_decrement_floatingActionButton'),
              onTap: () => bloc.add(CounterDecrementPressed()),
              icon: const Icon(Icons.remove, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DataWidget(),
                const SizedBox(height: 10),
                ButtonWidget(
                  key: const Key('counterView_backToZero_floatingActionButton'),
                  onTap: () => bloc.add(CounterBackToZero()),
                  icon: const Icon(Icons.delete, color: Colors.white),
                  widht: 100,
                ),
              ],
            ),
            ButtonWidget(
              key: const Key('counterView_increment_floatingActionButton'),
              onTap: () => bloc.add(CounterIncrementPressed()),
              icon: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('counterView_nextPage_floatingActionButton'),
        onPressed: () {
          Navigator.of(context).pushNamed("/other");
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}
