import 'package:flutter/material.dart';
import 'package:users_app_with_bloc/bloc_observer.dart';
import 'package:users_app_with_bloc/blocs/bloc_export.dart';
import 'package:users_app_with_bloc/repositories/user_repository.dart';
import 'package:users_app_with_bloc/screens/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // injecting userRepository
        BlocProvider<UserBloc>(create: (_) => UserBloc(UserRepository())),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
