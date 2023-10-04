import 'package:flutter/material.dart';
import 'package:users_app_with_bloc/blocs/bloc_export.dart';
import 'package:users_app_with_bloc/models/user_model.dart';
import 'package:users_app_with_bloc/repositories/user_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        // using the userBloc and adding the loadUserEvent to load the user
        return UserBloc(UserRepository())..add(LoadUserEvent());
      },
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserErrorState) {
          return Center(child: Text("Error ${state.error}"));
        }
        if (state is UserLoadedState) {
          List<UserModel> userList = state.users;
          return _buildUserListUI(userList, context);
        }
        return Container();
      }),
    );
  }

  ListView _buildUserListUI(List<UserModel> userList, BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                title: Text(
                  '${userList[index].firstName}  ${userList[index].lastName}',
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '${userList[index].email}',
                  style: const TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(userList[index].avatar.toString()),
                ),
              ),
            ),
          );
        });
  }
}
