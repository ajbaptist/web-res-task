import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task/src/data/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<TriggerSignupEvent>((event, emit) async {
      emit(RegisterLoading());

      final res = await AuthRepository.registerService(
          mail: event.mail, password: event.password);

      if (res) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailed());
      }
    });
  }
}
