import 'package:my_cupboard_app/features/auth/domain/entities/user.dart';

class UserMapper {
  static User? userJsonToEntity(Map<String, dynamic> userJson) => User(
      id: userJson['id']??'',
      firstName: userJson['firstName'],
      secondName: userJson['secondName'],
      firstLastName: userJson['firstLastName'],
      secondLastName: userJson['secondLastName'],
      roles: List<String>.from(userJson['roles']?.map(((role) => role)) ?? []),
      email: userJson['email'],
      token: userJson['token']);
}
