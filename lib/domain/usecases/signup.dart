import '../repositories/auth_repository.dart';
import '../../data/models/user_model.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<UserModel?> call(UserModel user) {
    return repository.signup(user);
  }
}
