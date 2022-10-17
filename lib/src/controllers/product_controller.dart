import 'package:get/get.dart';
import 'package:my_app/src/models/product.dart';
import 'package:my_app/src/services/product_service.dart';

class ProductController extends GetxController {

  var count = 0;
  var isLoading = false.obs;
  var loadError = false.obs;

  var products = [];
  final service = Get.put(ProductService());

  loadProducts() async {
    isLoading.value = true;
    Response response = await service.get('posts');
    if(response.hasError) {
      loadError.value = true;
    }
    else {
      print(response.body);
      products.add(Product('iPhone XR', 1000, 'Amazing'));
    }
    isLoading.value = false;
  }
}