import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/src/controllers/product_controller.dart';

class Home extends StatelessWidget {

  final _controller = Get.put(ProductController());

  Home({super.key});

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
      children: [
        const Icon(Icons.not_accessible),
        const SizedBox(height: 10,),
        const Text('Oops! We are unable to load Data. Please try again'),
        const SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Reload'),
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
            'There are 0 products available',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
              itemCount: _controller.products.length,
              itemBuilder: (context, index) => _productCard()
            )
        )
      ],
    );
  }

  Widget _productCard() {
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
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  child: const Text('View'),
                  onPressed: () {
                    Get.toNamed('/details');
                  },
                ),
              )
            ],
          ),
      );
  }
}