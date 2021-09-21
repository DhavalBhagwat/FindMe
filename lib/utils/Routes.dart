import 'package:get/get.dart';
import '../screens/LoginActivity.dart';
import '../screens/HomeActivity.dart';

class Routes {

  static final routes = [
    GetPage(name: '/loginActivity', page: () => LoginActivity()),
    GetPage(name: '/homeActivity', page: () => HomeActivity()),
  ];

}
