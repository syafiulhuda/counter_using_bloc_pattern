// ignore_for_file: avoid_print

import 'package:bloc_counter_kuldii/bloc/theme/theme_bloc.dart';
import 'package:bloc_counter_kuldii/bloc/user/user_bloc.dart';
import 'package:bloc_counter_kuldii/widgets/app_bar_widget.dart';
import 'package:bloc_counter_kuldii/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    UserBloc userBloc = context.read<UserBloc>();

    TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );

    return Scaffold(
      appBar: AppBarWidget(
        title: "User Page",
        onActionPressed: () {
          themeBloc.add(ThemeTooglePressed());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // ! Bloc Selector
            // ! Digunakan agar ketika Button add & remove di klik, "Nama" tidak di build ulang
            // ! Jadi lebih efisien
            // ? Tipe selector tergantung jenis datanya
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state["name"],
              builder: (context, state) {
                print("Name => Di Build");
                return Text("Name: $state", style: textStyle);
              },
            ),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state["age"],
              builder: (context, state) {
                print("Age => Di Build");
                return Text("Name: $state", style: textStyle);
              },
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => userBloc.add(
                UserChangeName(newName: value),
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonWidget(
                  icon: const Icon(Icons.add),
                  onTap: () => userBloc
                      .add(UserChangeAge(newAge: userBloc.state["age"] + 1)),
                ),
                ButtonWidget(
                  icon: const Icon(Icons.remove),
                  onTap: () => userBloc
                      .add(UserChangeAge(newAge: userBloc.state["age"] - 1)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
