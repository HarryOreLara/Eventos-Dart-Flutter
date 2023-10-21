import 'package:app_pruebas/bloc/sucursales/sucursales_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSucursalBloc extends StatefulWidget {
  const HomeSucursalBloc({super.key});

  @override
  State<HomeSucursalBloc> createState() => _HomeSucursalBlocState();
}

class _HomeSucursalBlocState extends State<HomeSucursalBloc> {
  @override
  void initState() {
    context.read<SucursalesBloc>().add(GetAllSucursales());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SucursalesBloc, SucursalesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Lista de sucursales"),
          ),
          body: state.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: state.listSucursal.length,
                  itemBuilder: (context, index) {
                    final sucursal = state.listSucursal[index];
                    return InkWell(
                      onTap: () {
                        print(sucursal.id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Container(
                          height: 100.0,
                          child: Card(
                            elevation: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    sucursal.nombre,
                                    maxLines: 2,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    sucursal.direccion,
                                    maxLines: 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
