
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
};