import 'package:app_pruebas/bloc/sucursales/sucursales_bloc.dart';
import 'package:app_pruebas/screens/home/home_bloc_sucursal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SucursalesBloc>(
        create: (_) => SucursalesBloc(),
      )
    ], child: const MaterialApp(home: HomeSucursalBloc()));
  }
}
