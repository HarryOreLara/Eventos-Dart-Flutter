
import 'package:app_pruebas/models/sucursal_model.dart';

class SucursalMapper {
  static SucursalModel sucursalDbToEntity(SucursalModel sucursalModel) =>
      SucursalModel(
          id: sucursalModel.id,
          nombre: sucursalModel.nombre,
          direccion: sucursalModel.direccion);
}
