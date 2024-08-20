part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserChangeName extends UserEvent {
  final String newName;

  UserChangeName({required this.newName});
}

class UserChangeAge extends UserEvent {
  final int newAge;

  UserChangeAge({required this.newAge});
}
