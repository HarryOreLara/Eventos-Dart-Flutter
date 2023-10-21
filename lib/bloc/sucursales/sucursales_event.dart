part of 'sucursales_bloc.dart';

sealed class SucursalesEvent extends Equatable {
  const SucursalesEvent();

  @override
  List<Object> get props => [];
}


class GetAllSucursales extends SucursalesEvent{}
