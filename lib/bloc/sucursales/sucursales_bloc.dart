import 'package:app_pruebas/domain/repositories/sucursal_repositoru_domain.dart';
import 'package:app_pruebas/infraestructure/sucursal/sucursal_infraestructure.dart';
import 'package:app_pruebas/models/sucursales_entitie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sucursales_event.dart';
part 'sucursales_state.dart';

class SucursalesBloc extends Bloc<SucursalesEvent, SucursalesState> {
  late SucursalRepositoryDomain _repositoryDomain;

  SucursalesBloc() : super(const SucursalesState()) {
    _repositoryDomain = SucursalInfraestructure();

    on<GetAllSucursales>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response = await _repositoryDomain.readAllSucursales();
        emit(state.copyWith(loading: false, listSucursal: response));
      } catch (e) {
        try {
          emit(
              state.copyWith(loading: false, error: (e as dynamic)['message']));
        } catch (e) {
          emit(state.copyWith(
              loading: false, error: 'Ocurrio un error de segundo nivel'));
        }
      }
    });
  }
}
