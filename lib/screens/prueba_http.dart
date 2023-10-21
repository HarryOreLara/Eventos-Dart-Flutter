import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PruebaHttp extends StatelessWidget {
  const PruebaHttp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueebas Http"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final dio = Dio(
            BaseOptions(
                baseUrl: 'https://www.emtrafesa.com/app/api/',
                headers: {'Content-Type': 'application/json'}),
          );

          final response = await dio.get('Sucursal/ListarSucursal/0');
          print(response.data);
        },
      ),
    );
  }
}
