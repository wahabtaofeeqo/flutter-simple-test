import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ProductService extends GetConnect implements GetxService {

  @override
  void onInit() {

    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com/';

    httpClient.addAuthenticator((Request request) async {
      const token = "username";
      request.headers['Authorization'] = token;
      return request;
    });
  }
}