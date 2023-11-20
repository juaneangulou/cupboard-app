import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cupboard_app/features/auth/domain/domain.dart';
import 'package:my_cupboard_app/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:my_cupboard_app/features/shared/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:my_cupboard_app/features/user/domain/entities/user-info.dart';

import '../../infrastructure/repositories/auth_repository.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkStatus();
  }
  void loginUser(String email, String password) async {
    //  state = state.copyWith(AuthStatus.checking, null, null);
    //  final user = await AuthRepositoryImpl().login(email, password);
    //  if(user != null){
    //    state = state.copyWith(AuthStatus.authenticated, user, null);
    //  }else{
    //    state = state.copyWith(AuthStatus.unauthenticated, null, 'Invalid credentials');
    //  }
    await Future.delayed(Duration(seconds: 2));
    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
      getUserInfoAuth();
    } catch (e) {
      await logout('Invalid credentials');
    }
  }

  void registerUser() {}

  void checkStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    //print("Token in Get Token $token");
    if (token == null) return logout("");
    try {
      final user = await authRepository.checkStatus(token);
      _setLoggedUser(user);
      getUserInfoAuth();
    } catch (e) {
      await logout('Invalid credentials');
    }
  }

  void _setLoggedUser(User? user) async {
    await keyValueStorageService.setKeyValue('token', user?.token);
    final token = await keyValueStorageService.getValue<String>('token');
    //print("Token in Set Token $token");
    state = state.copyWith(AuthStatus.authenticated, user, null, null);
  }

  void _setLoggedUserInfo(UserInfo? user) async {
    // await keyValueStorageService.setKeyValue('token', user?.token);
    // final token = await keyValueStorageService.getValue<String>('token');
    //print("Token in Set Token $token");
    state = state.copyWith(null, null, null, user);
  }

  Future<void> logout(String? errorMessage) async {
    await keyValueStorageService.removeKey('token');
    state =
        state.copyWith(AuthStatus.unauthenticated, null, errorMessage, null);
  }

  void getUserInfoAuth() async {
    final token = await keyValueStorageService.getValue<String>('token');
    //print("Token in Get Token $token");
    try {
      final user = await authRepository.getUserInfoAuth(token ?? '');
      _setLoggedUserInfo(user);
    } catch (e) {
      //await logout('Invalid credentials');
    }
  }
}

enum AuthStatus { checking, authenticated, unauthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? errorMessage;
  final UserInfo? userInfo;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = '',
      this.userInfo});
  AuthState copyWith(AuthStatus? authStatus, User? user, String? errorMessage,
          UserInfo? userInfo) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage,
          userInfo: userInfo ?? this.userInfo);
}
