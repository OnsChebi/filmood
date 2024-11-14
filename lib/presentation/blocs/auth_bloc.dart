import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/signup.dart';
import '../../data/models/user_model.dart';

abstract class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}
class SignupEvent extends AuthEvent {
  final UserModel user;

  SignupEvent(this.user);
}

abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);
}
class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;

  AuthBloc(this.loginUseCase, this.signupUseCase) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield AuthLoading();
      try {
        final user = await loginUseCase(event.email, event.password);
        yield AuthSuccess(user!);
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is SignupEvent) {
      yield AuthLoading();
      try {
        final user = await signupUseCase(event.user);
        yield AuthSuccess(user!);
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    }
  }
}
