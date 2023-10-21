import 'package:app_pruebas/domain/repositories/users_repository_domain.dart';
import 'package:app_pruebas/infraestructure/repositories/users_repositorio_infraestructure.dart';
import 'package:app_pruebas/models/users/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  late UserRepository _userRepository;

  UsersBloc() : super(const UsersState()) {
    _userRepository = UserRepositoryImpl();

    on<GetAllUsers>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final resp = await _userRepository.getAllUsers();
        emit(state.copyWith(loading: false, listUsers: resp));
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
