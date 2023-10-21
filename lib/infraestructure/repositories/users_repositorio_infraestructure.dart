import 'package:app_pruebas/domain/repositories/users_repository_domain.dart';
import 'package:app_pruebas/models/users/user_model.dart';
import 'package:app_pruebas/utils/constants.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<List<UserModel>> getAllUsers() async {
    var response = await Dio().get('${Constants.apiUrl}/users',
        options: Options(headers: {
          Headers.contentTypeHeader: 'application/json',
          Headers.acceptHeader: 'application/json',
          'Authorization': 'Bearer ${Constants.token}'
        }));

    if (response.statusCode != 200) {
      throw Exception(response.statusMessage);
    }

    return ((response.data) as List)
        .map((element) => UserModel.fromJson(element))
        .toList();
  }
}
