import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screens/auth/verification_code_screen.dart';
import 'package:flutter/cupertino.dart';

import 'view/screens/auth/forget_password_screen.dart';
import 'view/screens/auth/reset_password_screen.dart';
import 'view/screens/on_boarding_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  OnBoardingScreen.rootName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  VerificationCodeScreen.routeName: (context) => const VerificationCodeScreen(),
  ResetPasswordScreen.routeName: (context) => const ResetPasswordScreen(),
};
