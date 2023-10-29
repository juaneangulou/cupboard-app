import 'package:my_cupboard_app/features/auth/domain/domain.dart';
import 'package:my_cupboard_app/features/auth/infrastructure/datasources/auth_datasource_impl.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthDatasources _datasources;

  AuthRepositoryImpl({AuthDatasources? datasources}) : _datasources = datasources?? AuthDatasourceImpl();

  @override
  Future<User?> login(String email, String password) {
    return _datasources.login(email, password);
  }

  @override
  Future<User?> register(String email, String password) {
    return _datasources.register(email, password);
  }
  
  @override
  Future<User?> checkStatus(String token) {
    return _datasources.checkStatus(token);
  }
  
}