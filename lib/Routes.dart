import 'package:get/get.dart';
import 'LoginActivity.dart';
import 'HomeActivity.dart';

class Routes {

  static final routes = [
    GetPage(name: '/loginActivity', page: () => LoginActivity()),
    GetPage(name: '/homeActivity', page: () => HomeActivity()),
  ];

}
