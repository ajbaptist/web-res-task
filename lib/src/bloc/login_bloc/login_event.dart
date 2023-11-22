part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class TriggerLoginEvent extends LoginEvent {
  final String mail;
  final String password;

  TriggerLoginEvent(this.mail, this.password);
}
