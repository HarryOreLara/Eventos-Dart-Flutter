import 'package:app_pruebas/infraestructure/sucursal/sucursal_infraestructure.dart';
import 'package:app_pruebas/models/sucursales_entitie.dart';
import 'package:flutter/material.dart';

class PruebaSucursal extends StatelessWidget {
  const PruebaSucursal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Probando sucursales"),
      ),
      body: const CustomDropdown(descripcion: "Añadir"),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SucursalInfraestructure sucursalInfraestructure =
              SucursalInfraestructure();
          final response = await sucursalInfraestructure.readAllSucursales();
          print(response);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  final String descripcion;
  const CustomDropdown({super.key, required this.descripcion});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  //final List<String> _friendName = ["Trujillo", "Lima", "Chiclayo"];
  List<Sucursal> _friendName = [];


  String? _selectedFriend;

  @override
  void initState() async {
    super.initState();
    SucursalInfraestructure sucursalInfraestructure = SucursalInfraestructure();
    final response = await sucursalInfraestructure.readAllSucursales();
   
   setState(() {
     _friendName = response;
   });

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0)),
        child: DropdownButton<String>(
          hint: Text(
            widget.descripcion,
            style: TextStyle(
                color: Colors.grey.shade400, fontFamily: 'Gotham-Medium'),
          ),
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          value: _selectedFriend,
          elevation: 2,
          underline: Container(
            height: 0.0,
          ),
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
          iconSize: 36.0,
          isExpanded: true,
          dropdownColor: Colors.white,
          style: const TextStyle(color: Colors.black, fontSize: 16.0),
          onChanged: (value) {
            setState(() {
              _selectedFriend = value!;
            });
          },
          items: _friendName.map((e) {
            return DropdownMenuItem<String>(
              value: e.toString(),
              child: Text(e.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
