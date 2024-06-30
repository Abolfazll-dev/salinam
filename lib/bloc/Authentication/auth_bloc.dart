
import 'package:bloc/bloc.dart';
import 'package:salinam/bloc/Authentication/auth_event.dart';
import 'package:salinam/bloc/Authentication/auth_state.dart';
import 'package:salinam/data/Repositories/Authentication_Repository.dart';
import 'package:salinam/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _repository = locator.get();
  AuthBloc() : super(AuthStateInit()) {
    on<AuthLoginRequest>(((event, emit) async {
      emit(AuthStateLoading());
      var response = await _repository.login(event.username, event.password);
      emit(AuthResponseState(response));
    }));
    on<AuthRegisterRequest>(((event, emit) async {
      emit(AuthStateLoading());
      var response = await _repository.register(event.username, event.password,event.passwordConfirm,event.name,event.email);
      emit(AuthResponseState(response));
    }));
  }
}
