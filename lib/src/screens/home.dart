import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/controllers/product_controller.dart';
import 'package:my_app/src/models/product.dart';

class Home extends StatelessWidget {

  final _controller = Get.put(ProductController());

  Home({super.key}) {
    _controller.loadProducts(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {

        //
        if(_controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(),);
        }

        //
        if(_controller.loadError.isTrue) {
          return _reloadComponent();
        }

        //
        return _buildBody();
      }),
    );
  }

  Widget _reloadComponent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.not_accessible),
        const SizedBox(height: 10,),
        const Text('Oops! We are unable to load Data. Please try again'),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _controller.loadProducts(1);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Reload'),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: const Text(
            'There are $_controller.count products available',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
              itemCount: _controller.products.length,
              itemBuilder: (context, index) => _productCard(_controller.products[index])
            )
        )
      ],
    );
  }

  Widget _productCard(Product product) {
      return Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                  'images/headset.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
              ),
              const ListTile(
                title: Text("${product.name}"),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: const Text('View'),
                  onPressed: () {
                    Get.toNamed('/details', arguments: product);
                  },
                ),
              )
            ],
          ),
      );
  }
}