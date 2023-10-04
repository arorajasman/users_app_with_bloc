import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_bloc/models/user_model.dart';
import 'package:users_app_with_bloc/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  // injecting userRepository for doing CRUD operations with the api
  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(_onLoadUserEvent);
  }

  _onLoadUserEvent(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final users = await _userRepository.getUsers();
      emit(UserLoadedState(users: users));
    } catch (e) {
      emit(UserErrorState(error: e.toString()));
    }
  }
}
