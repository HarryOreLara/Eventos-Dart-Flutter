import 'dart:convert';
import 'package:app_pruebas/core/utils/typedef.dart';
import 'package:app_pruebas/models/sucursales_entitie.dart';

class SucursalModel extends Sucursal {
  SucursalModel(
      {required super.id, required super.nombre, required super.direccion});

  factory SucursalModel.fromJson(String source) =>
      SucursalModel.fromMap(jsonDecode(source) as DataMap);

  SucursalModel.fromMap(DataMap map)
      : this(
            id: map['id'] as String,
            nombre: map['nombre'] as String,
            direccion: map['direccion'] as String);

  SucursalModel copyWith({String? id, String? nombre, String? direccion}) {
    return SucursalModel(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        direccion: direccion ?? this.direccion);
  }

  DataMap toMap() => {'id': id, 'nombre': nombre, 'direccion': direccion};

  String toJson() => jsonEncode(toMap());
}
