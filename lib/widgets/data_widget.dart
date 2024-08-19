import 'package:bloc_counter_kuldii/bloc/counter/counter_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ! Opsional jika data context tidak terbaca
    // ! Ambil context dari provider
    // ? Style 1
    // CounterBloc counterBloc = context.read<CounterBloc>();
    // ? Style 2
    // CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
        color: Colors.pinkAccent,
      ),
      child: Center(
        child: MultiBlocListener(
          listeners: [
            BlocListener<CounterBloc, int>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Angka Genap"),
                  ),
                );
              },
              listenWhen: (previous, current) {
                if (current % 2 == 0 && current > 0) {
                  return true;
                } else {
                  return false;
                }
              },
            ),
            BlocListener<ThemeBloc, bool>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: state == false
                        ? const Text("Tema Gelap")
                        : const Text("Tema Terang"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              listenWhen: (previous, current) {
                // ? Selalu melisten dalam kondisi apapun
                return true;
              },
            ),
          ],
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text(
                "$state",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              );
            },
          ),
        ),
        // child: BlocConsumer<CounterBloc, int>(
        //   listener: (context, state) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         duration: Duration(seconds: 1),
        //         content: Text("Angka Genap"),
        //       ),
        //     );
        //   },
        //   listenWhen: (previous, current) {
        //     if (current % 2 == 0 && current > 0) {
        //       return true;
        //     } else {
        //       return false;
        //     }
        //   },
        //   builder: (context, state) {
        //     return Text(
        //       "$state",
        //       style: const TextStyle(fontSize: 25, color: Colors.white),
        //     );
        //   },
        // ),
      ),
    );
  }
}
