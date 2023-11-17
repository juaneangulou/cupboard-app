import 'package:shared_preferences/shared_preferences.dart';
import 'key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    // switch (T) {
    //   case int:
    //     return prefs.getInt(key) as T?;

    //   case String:
    //     return prefs.getString(key) as T?;

    //   default:
    //     throw UnimplementedError(
    //         'GET not implemented for type ${T.runtimeType}');
    // }

    if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else {
      throw UnimplementedError('Get not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    // switch(T) {
    //   case int:
    //     prefs.setInt( key, value as int );
    //     break;

    //   case String:
    //   case String?:
    //     prefs.setString(key, value as String);
    //     break;

    //   default:
    //     throw UnimplementedError('Set not implemented for type ${ T.runtimeType }');
    // }

    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      throw UnimplementedError(
          'Set not implemented for type ${value.runtimeType}');
    }
  }
}
