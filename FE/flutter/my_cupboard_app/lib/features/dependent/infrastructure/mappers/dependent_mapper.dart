import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';

class DependentMapper {
  static Dependent? DependentJsonToEntity(Map<String, dynamic> json) => Dependent(
      id: json['id'],
      name: json['name'],
      dateOfBirth: json['dateOfBirth'],
      userId: json['userId']
  );
}