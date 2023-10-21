import 'package:app_pruebas/models/sucursales_entitie.dart';

abstract class SucursalRepositoryDomain {
  Future<List<Sucursal>> readAllSucursales();
}
