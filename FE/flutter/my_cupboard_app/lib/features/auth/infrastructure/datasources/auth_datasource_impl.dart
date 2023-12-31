import 'package:dio/dio.dart';
import 'package:my_cupboard_app/config/config.dart';
import 'package:my_cupboard_app/features/auth/domain/datasources/auth_datasources.dart';
import 'package:my_cupboard_app/features/auth/domain/entities/user.dart';
import 'package:my_cupboard_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_cupboard_app/features/auth/infrastructure/infrastructure.dart';
import 'package:my_cupboard_app/features/auth/infrastructure/mappers/user_info_mapper.dart';
import 'package:my_cupboard_app/features/user/domain/entities/user-info.dart';

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
  Future<User?> checkStatus(String token) async {
    try {
      final response = dio.post('/api/auth/refresh-token', options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      ));
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
  Future<UserInfo?> getUserInfoAuth(String token) async{
    try {
      final response = dio.get('/api/auth/user-info', options: Options(
        headers: {
          'Authorization': 'Bearer $token'
        }
      ));
      final responseFull = (await response).data;
      final user = UserInfoMapper.userJsonToEntity(responseFull);
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
}
