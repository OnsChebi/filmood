import 'package:filmood/data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> login(String email, String password);
  Future<UserModel?> signup(UserModel user);
}
