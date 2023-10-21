import 'package:app_pruebas/models/users/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getAllUsers();
}
