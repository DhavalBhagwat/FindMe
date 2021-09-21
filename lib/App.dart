import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'utils/Routes.dart';

class App extends StatefulWidget {

  @override
  _AppState createState() => _AppState();

}

class _AppState extends State<App> {

  static const String _TAG = "App";
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //scrollBehavior: ScrollPhysicsBehaviour(),
      initialRoute: '/homeActivity',
      getPages: Routes.routes,
    );
  }


}