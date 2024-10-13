import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  String? message;
  switch (type) {
    case "username":
      {
        if (!GetUtils.isUsername(val)) message = "Not valid username";
        break;
      }
    case "email":
      {
        if (!GetUtils.isEmail(val)) message = "Not valid email";
        break;
      }
    case "phone":
      {
        if (!GetUtils.isEmail(val)) message = "Not valid phone number";
        break;
      }
    default:
      {
        if (val.isEmpty) {
          message = "can't be empty";
        } else if (val.length < min) {
          message = "can't be less than $min";
        } else {
          if (val.length > max) message = "can't be greater than $max";
        }
      }
  }
  return message;
}
