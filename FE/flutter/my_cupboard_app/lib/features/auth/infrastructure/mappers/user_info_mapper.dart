import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';
import 'package:my_cupboard_app/features/dependent/infrastructure/mappers/dependent_mapper.dart';
import 'package:my_cupboard_app/features/user/domain/entities/user-info.dart';

class UserInfoMapper {
  static UserInfo? userJsonToEntity(Map<String, dynamic> json) {
    // Convertir dependientes de JSON a la lista de objetos Dependents
    var dependentsFromJson = json['dependents'] as List? ?? [];
    List<Dependent?> dependentsList = dependentsFromJson.map((depJson) => DependentMapper.DependentJsonToEntity(depJson)).toList();

    return UserInfo(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dependents: dependentsList,
    );
  }  
}
