import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/check_internet_connection.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    try {
      if (await checkInternetConnection()) {
        var response = await http.post(Uri.parse(linkUrl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonEncode(response.body) as Map;
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.SERVER_FAILURE);
        }
      } else {
        return const Left(StatusRequest.OFFLINE_FAILURE);
      }
    } catch (_) {
      return const Left(StatusRequest.SERVER_FAILURE);
    }
  }
}