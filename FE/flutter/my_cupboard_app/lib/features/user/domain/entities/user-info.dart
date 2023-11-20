import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';

class UserInfo {
  final int userId;
  final String firstName;
  final String lastName;
  final List<Dependent?> dependents;

  UserInfo({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.dependents,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    var dependentsFromJson = json['dependents'] as List;
    List<Dependent> dependentsList = dependentsFromJson.map((i) => Dependent.fromJson(i)).toList();

    return UserInfo(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dependents: dependentsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'dependents': dependents.map((d) => d?.toJson()).toList(),
    };
  }
}
