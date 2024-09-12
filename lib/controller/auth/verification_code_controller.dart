import 'package:ecommerce_app/view/screens/auth/reset_password_screen.dart';
import 'package:get/get.dart';

abstract class VerificationCodeController extends GetxController {
  checkCode();

  navigateToResetPassword();
}

class VerificationCodeControllerImpl extends VerificationCodeController {
  late String code;

  @override
  navigateToResetPassword() {
    Get.offNamed(ResetPasswordScreen.routeName);
  }

  @override
  checkCode() {
    // TODO: implement VerificationCode
    throw UnimplementedError();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
