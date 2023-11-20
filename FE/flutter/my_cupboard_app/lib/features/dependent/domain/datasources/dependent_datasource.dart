import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';

abstract class DependentDatasources {
  Future<Dependent?> Add(Dependent newDependent);
  Future<Dependent?> Update(Dependent newDependent);
  Future<List<Dependent?>> GetDependent(int userId, String token);
  Future<Dependent?> Delete(int id);
}
