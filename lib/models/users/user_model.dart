import 'package:app_pruebas/core/utils/typedef.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  UserModel({this.id, this.name, this.email, this.gender, this.status});

  UserModel.fromJson(DataMap json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  DataMap toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['status'] = this.status;
    return data;
  }
}
