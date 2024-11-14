import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';
import '../sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<UserModel?> login(String email, String password) async {
    return await dataSource.login(email, password);
  }

  @override
  Future<UserModel?> signup(UserModel user) async {
    return await dataSource.signup(user);
  }
}
