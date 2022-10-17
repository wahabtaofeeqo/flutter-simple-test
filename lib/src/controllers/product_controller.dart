import 'package:get/get.dart';
import 'package:my_app/src/models/product.dart';
import 'package:my_app/src/services/product_service.dart';

class ProductController extends GetxController {

  // Total products
  var page = 1
  var count = 0;

  // Flags
  var isLoading = false.obs;
  var loadError = false.obs;

  // Flags for update
  var deleted = false.obs;
  var updated = false.obs;

  // Data
  var products = [];

  //
  final service = Get.put(ProductService());

  loadProducts(page) async {
    isLoading.value = true;
    Response response = await service.get('products?page=$page');
    if(response.hasError) {
      loadError.value = true;
    }
    else {
      page = response.body.page;
      count = response.body.total;
      products.add(response.body.data);
    }
    isLoading.value = false;
  }

  updateProduct(id, data) {
     Response response = await service.put('products/$id', data);
  }

  deleteProduct(id) {
     Response response = await service.delete('products/$id');
  }
}