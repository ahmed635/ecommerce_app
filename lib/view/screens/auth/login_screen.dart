import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login_screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "Sign In",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: ListView(
          children: [
            const LogoWidget(),
            const SizedBox(
              height: 20,
            ),
            buildTitleWidget(context),
            const SizedBox(
              height: 10,
            ),
            buildBodyText(context),
            const SizedBox(
              height: 35,
            ),
            CustomTextFormField(
              hintText: "Enter Your Email",
              labelText: "Email",
              iconData: Icons.email_outlined,
              controller: emailController,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
              controller: passwordController,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Forget Password",
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: "Sign In",
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Text(
                  "Don't have an account ?",
                  textAlign: TextAlign.end,
                ),
                InkWell(
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildBodyText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Sign In With Your Email And Password Or Continue With Social Media",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "Welcome Back",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
