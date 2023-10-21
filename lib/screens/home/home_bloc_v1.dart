import 'package:app_pruebas/bloc/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocv1 extends StatefulWidget {
  const HomeBlocv1({super.key});

  @override
  State<HomeBlocv1> createState() => _HomeBlocv1State();
}

class _HomeBlocv1State extends State<HomeBlocv1> {
  @override
  void initState() {
    context.read<UsersBloc>().add(GetAllUsers());

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Lista de Usuarios"),
            ),
            body: state.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final user = state.listUsers[index];
                      
                    },
                  ));
      },
    );
  }
}
