part of 'user_bloc.dart';

// NOTE:
// Equatable is used to compare the values wether they are same or not. If two variable have the same values we are not going to change or update UI.

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  const UserLoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String error;
  const UserErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
