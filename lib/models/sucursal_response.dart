
import 'package:app_pruebas/core/utils/typedef.dart';
import 'package:app_pruebas/models/sucursal_model.dart';

class SucursalResponse {
  final List<SucursalModel> data;
  final int status;
  final String transactionId;
  final String errors;

  SucursalResponse(
      {required this.data,
      required this.status,
      required this.transactionId,
      required this.errors});

  factory SucursalResponse.fromJson(DataMap json) => SucursalResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SucursalModel.fromMap(e))
              .toList() ??
          [],
      status: json['status'] ?? 404,
      transactionId: json['transactionId'] ?? '',
      errors: json['errors'] ?? '');

  // factory SucursalResponse.fromJson(DataMap json) {
  //   final sucursalList = json['data'];
  //   if (sucursalList == null) {
  //     return SucursalResponse(
  //         data: [], status: 400, transactionId: "", errors: "");
  //   }

  //   if (sucursalList is List<dynamic>) {
  //     return SucursalResponse(
  //         data: sucursalList.map((e) => SucursalModel.fromJson(e)).toList(),
  //         status: json['status'] ?? 0,
  //         transactionId: json['transactionId'] ?? '',
  //         errors: json['errors'] ?? '');
  //   } else {
  //     return SucursalResponse(
  //         data: [],
  //         status: json['status'] ?? 0,
  //         transactionId: json['transactionId'] ?? '',
  //         errors: json['errors'] ?? '');
  //   }
  // }
}
