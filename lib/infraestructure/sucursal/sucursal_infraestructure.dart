import 'package:app_pruebas/domain/repositories/sucursal_repositoru_domain.dart';
import 'package:app_pruebas/mappers/sucursal_mapper.dart';
import 'package:app_pruebas/models/sucursal_response.dart';
import 'package:app_pruebas/models/sucursales_entitie.dart';
import 'package:dio/dio.dart';

class SucursalInfraestructure extends SucursalRepositoryDomain {
  final dio = Dio(BaseOptions(baseUrl: 'https://www.emtrafesa.com/app/api'));

  @override
  Future<List<Sucursal>> readAllSucursales() async {
    final response = await dio.get('/Sucursal/ListarSucursal/0');
    final result = SucursalResponse.fromJson(response.data);
    final List<Sucursal> listaSucursal =
        result.data.map((e) => SucursalMapper.sucursalDbToEntity(e)).toList();
    return listaSucursal;
  }
}
