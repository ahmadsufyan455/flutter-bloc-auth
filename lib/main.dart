import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/data/repository/app_repository.dart';
import 'package:flutter_auth_bloc/presentation/login/bloc/login_bloc.dart';
import 'package:flutter_auth_bloc/presentation/login/login_page.dart';
import 'package:flutter_auth_bloc/presentation/register/bloc/register_bloc.dart';
import 'package:flutter_auth_bloc/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(AppRepository()),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(AppRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: routes,
        home: const LoginPage(),
      ),
    );
  }
}
