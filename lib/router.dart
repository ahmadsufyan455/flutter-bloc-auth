import 'package:flutter/material.dart';
import 'package:flutter_auth_bloc/presentation/home/home_page.dart';
import 'package:flutter_auth_bloc/presentation/login/login_page.dart';
import 'package:flutter_auth_bloc/presentation/register/register_page.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/home': (context) => const HomePage(),
};
