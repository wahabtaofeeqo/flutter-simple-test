import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ProductService extends GetConnect implements GetxService {

  @override
  void onInit() {

    httpClient.baseUrl = 'http://192.168.43.8:5000/api/v1/';

    httpClient.addAuthenticator((Request request) async {
      final cred = "3442f8959a84dea7ee197c632cb2df15:13023"
      request.headers['Authorization'] = base64.encode(cred.codeUnits);
      return request;
    });
  }
}