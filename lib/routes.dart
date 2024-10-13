import 'package:ecommerce_app/view/screens/home/home_screen.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screens/items/items_screen.dart';
import 'package:flutter/material.dart';

import 'view/screens/auth/forget_password_screen.dart';
import 'view/screens/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ItemsScreen.routeName: (context) => const ItemsScreen(),
};
