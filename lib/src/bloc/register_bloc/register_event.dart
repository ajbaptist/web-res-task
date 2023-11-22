part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class TriggerSignupEvent extends RegisterEvent {
  final String mail;
  final String password;

  TriggerSignupEvent(this.mail, this.password);
}
