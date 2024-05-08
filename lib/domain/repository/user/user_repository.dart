import 'dart:async';

import '../../entity/user/user.dart';
import '../../usecase/user/login_usecase.dart';

abstract class UserRepository {
  Future<User?> login(LoginParams params);

  Future<void> saveIsLoggedIn(bool value);

  Future<bool> get isLoggedIn;
}
