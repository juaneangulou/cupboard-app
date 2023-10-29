import 'package:dio/dio.dart';
import 'package:my_cupboard_app/config/config.dart';
import 'package:my_cupboard_app/features/auth/domain/datasources/auth_datasources.dart';
import 'package:my_cupboard_app/features/auth/domain/entities/user.dart';
import 'package:my_cupboard_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_cupboard_app/features/auth/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasources {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  Future<User?> login(String email, String password) async {
    try {
      final response = dio.post('/api/auth/login',
          data: {'username': email, 'password': password});
      final responseFull = (await response).data;
      final user = UserMapper.userJsonToEntity(responseFull);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User?> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<User?> checkStatus(String token) {
    // TODO: implement checkStatus
    throw UnimplementedError();
  }
}
