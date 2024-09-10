
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';

import 'view/screens/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  OnBoardingScreen.rootName: (context) => const OnBoardingScreen(),
};