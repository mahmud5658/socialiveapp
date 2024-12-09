import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../model/network_response.dart';


class NetworkCaller {
  static Future<NetworkResponse> getRequest(url) async {
    try {
      Response response = await get(
          Uri.parse(url),);
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        final decodedData = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodedData);
      } else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      } else {
        return NetworkResponse(
            statusCode: response.statusCode, isSuccess: false);
      }
    } catch (e) {
      return NetworkResponse(
          statusCode: -1,
          isSuccess: false,
          responseData: null,
          errorMessage: e.toString());
    }
  }
}