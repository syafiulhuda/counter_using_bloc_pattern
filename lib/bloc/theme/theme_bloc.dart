// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  // ? Kondisi Awal true = Tema Terang
  ThemeBloc() : super(true) {
    on<ThemeTooglePressed>((event, emit) => emit(!state));
  }
}
