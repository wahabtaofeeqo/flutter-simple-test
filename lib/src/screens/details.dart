import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {

  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: const Text(
              'Edit Product',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Image.asset(
            'images/headset.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'iPhone XR',
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                    'Alps. Situated 1,578 meters above sea level, it is one of the '
                    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                    'half-hour walk through pastures and pine forest, leads you to the '
                    'lake, which warms to 20 degrees Celsius in the summer. Activities '
                    'enjoyed here include rowing, and riding the summer toboggan run.',
                    softWrap: true,
                ),
                const SizedBox(height: 14,),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/edit');
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.snackbar(
                              '',
                              'Product deleted');
                        },
                        child: const Text('Delete'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}