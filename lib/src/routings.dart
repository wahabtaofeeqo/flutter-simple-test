import 'package:get/get.dart';
import 'package:my_app/src/screens/details.dart';
import 'package:my_app/src/screens/edit.dart';
import 'package:my_app/src/screens/home.dart';

class Routes {

  static final routes = [
    GetPage(name: '/', page: () => Home()),
    GetPage(name: '/details', page: () => Details()),
    GetPage(name: '/edit', page: () => EditProduct())
  ];
}