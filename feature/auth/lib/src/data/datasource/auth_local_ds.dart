import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user);

  Future<UserModel?> getUser();

  Future<void> deleteUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box<UserModel> _userBox =
      Hive.box<UserModel>(HiveBoxName.USER_BOX_NAME);

  @override
  Future<void> deleteUser() async{
    return _userBox.delete(HiveFieldName.USER_FIELD_NAME);
  }

  @override
  Future<UserModel?> getUser() async{
    return _userBox.get(HiveFieldName.USER_FIELD_NAME);
  }

  @override
  Future<void> saveUser(UserModel user) {
    return _userBox.put(HiveFieldName.USER_FIELD_NAME, user);
  }
}
