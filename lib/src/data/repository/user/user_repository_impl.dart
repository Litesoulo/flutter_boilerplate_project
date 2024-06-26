import 'dart:async';

import '../../../domain/entity/user/user.dart';
import '../../../domain/repository/user/user_repository.dart';
import '../../../domain/usecase/user/login_usecase.dart';
import '../../sharedpref/shared_preference_helper.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  @override
  Future<User?> login(LoginParams params) async {
    return await Future.delayed(const Duration(seconds: 2), () => User());
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;
}
