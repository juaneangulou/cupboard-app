import 'package:my_cupboard_app/features/auth/domain/entities/user.dart';
import 'package:my_cupboard_app/features/user/domain/entities/user-info.dart';

abstract class AuthRepository {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
  Future<User?> checkStatus(String token);
  Future<UserInfo?> getUserInfoAuth(String token);
}
