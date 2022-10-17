import 'package:get/get.dart';
import 'package:my_app/src/services/product_service.dart';

class ProductController extends GetxController {

  var count = 0;
  var isLoading = false.obs;
  var loadError = false.obs;

  var products = [1, 2, 3, 4, 5];
  final service = Get.put(ProductService());

  loadProducts() {

  }
}