import 'package:my_cupboard_app/features/dependent/domain/datasources/dependent_datasource.dart';
import 'package:my_cupboard_app/features/dependent/domain/entities/dependent.dart';
import 'package:my_cupboard_app/features/dependent/infrastructure/datasources/dependent_datasource_impl.dart';
import 'package:my_cupboard_app/features/dependent/infrastructure/repositories/dependent_repository_impl.dart';
import 'package:my_cupboard_app/features/shared/infrastructure/services/key_value_storage_service_impl.dart';

class DependentRepositoryImpl extends DependentRepository {
  final DependentDatasources _dependentRepository;
  final keyValueStorageService = KeyValueStorageServiceImpl();

  DependentRepositoryImpl({DependentDatasources? dependentRepository})
      : _dependentRepository = dependentRepository ?? DependentDatasourceImpl();

  @override
  Future<Dependent?> Add(Dependent newDependent) {
    return _dependentRepository.Add(newDependent);
  }

  @override
  Future<Dependent?> Delete(int id) {
    return _dependentRepository.Delete(id);
  }

  @override
  Future<List<Dependent?>> GetDependent(int userId) async {
    final token = await keyValueStorageService.getValue<String>('token')??'';

    return _dependentRepository.GetDependent(userId, token);
  }

  @override
  Future<Dependent?> Update(Dependent newDependent) {
    return _dependentRepository.Update(newDependent);
  }
}
