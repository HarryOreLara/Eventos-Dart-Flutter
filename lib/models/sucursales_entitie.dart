import 'package:equatable/equatable.dart';

class Sucursal extends Equatable {
  final String id;
  final String nombre;
  final String direccion;

  Sucursal({required this.id, required this.nombre, required this.direccion});
  
  @override
  List<Object?> get props => [id, nombre, direccion];
  
}
