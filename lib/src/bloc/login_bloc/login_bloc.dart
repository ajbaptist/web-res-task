import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/src/data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<TriggerLoginEvent>((event, emit) async {
      emit(LoginLoading());

      final res = await AuthRepository.loginService(
          mail: event.mail, password: event.password);

      if (res) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    });
  }
}
