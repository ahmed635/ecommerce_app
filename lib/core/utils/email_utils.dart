import 'dart:math';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

class EmailUtils {
  static const String adminAccount = "ahmed.khaled.aa123@gmail.com";
  static const String adminPassword =
      "pxoc naut lhtr mtdg"; // 16 Digits App Password Generated From Google Account

  static Future<SendReport> sendVerificationCode(String toEmail, String code) async {
    SmtpServer smtpServer = gmail(adminAccount, adminPassword);
    final message = createEmailTemplateMessage(toEmail, code);
    return await send(message, smtpServer);
  }

  static createEmailTemplateMessage(String toEmail, String code) {
    return Message()
      ..from = const Address(adminAccount, 'Ecommerce-app')
      ..recipients.add(toEmail)
      ..subject = 'Verification Code'
      ..text =
          'Hello dear, I am sending you verification code from Ecommerce-app to'
              ' reset your password.\n\n verification code: $code';
  }

  static String generateVerificationCode() {
    var random = Random();
    return (10000 + random.nextInt(90000)).toString();
  }
}
