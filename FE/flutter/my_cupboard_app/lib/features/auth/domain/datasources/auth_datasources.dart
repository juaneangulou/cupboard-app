import 'package:my_cupboard_app/features/auth/domain/entities/user.dart';

abstract class AuthDatasources {
  Future<User?> login(String email, String password);
  Future<User?> register(String email, String password);
  Future<User?> checkStatus(String token);
}
