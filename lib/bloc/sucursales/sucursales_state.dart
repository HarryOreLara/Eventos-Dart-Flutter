part of 'sucursales_bloc.dart';

class SucursalesState extends Equatable {
  final bool loading;
  final String error;
  final List<Sucursal> listSucursal;

  const SucursalesState(
      {this.loading = false, this.error = '', this.listSucursal = const []});

  SucursalesState copyWith(
          {bool? loading, String? error, List<Sucursal>? listSucursal}) =>
      SucursalesState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          listSucursal: listSucursal ?? this.listSucursal);

  @override
  List<Object> get props => [loading, error, listSucursal];
}

final class SucursalesInitial extends SucursalesState {}
