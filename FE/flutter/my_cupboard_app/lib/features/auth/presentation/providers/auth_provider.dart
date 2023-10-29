import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cupboard_app/features/auth/domain/domain.dart';

import '../../infrastructure/repositories/auth_repository.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthNotifier({required this.authRepository}) : super(AuthState());
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
    } catch (e) {
      await logout('Invalid credentials');
    }
  }

  void registerUser() {}

  void checkStatus() {}

  void _setLoggedUser(User? user) async {
    state = state.copyWith(AuthStatus.authenticated, user, null);
  }

  Future<void> logout(String? errorMessage) async {
    state = state.copyWith(AuthStatus.unauthenticated, null, errorMessage);
  }
}

enum AuthStatus { checking, authenticated, unauthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String? errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking, this.user, this.errorMessage=''});
  AuthState copyWith(
          AuthStatus? authStatus, User? user, String? errorMessage) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage );
}
