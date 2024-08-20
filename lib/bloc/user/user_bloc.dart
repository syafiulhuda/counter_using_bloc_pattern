// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, Map<String, dynamic>> {
  UserBloc() : super({"name": "", "age": 0}) {
    on<UserChangeName>((event, emit) {
      emit({
        "name": event.newName,
        "age": state["age"],
      });
    });

    on<UserChangeAge>((event, emit) {
      int newAge = event.newAge;

      if (newAge >= 0) {
        emit({
          "name": state["name"],
          "age": newAge,
        });
      } else {
        emit(state);
      }
    });
  }
}
