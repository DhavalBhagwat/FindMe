import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sawo/sawo.dart';
import 'package:findme/utils/SawoUtils.dart';

class LoginActivity extends StatefulWidget {

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {

  Sawo? _sawo;

  @override
  void initState() {
    _sawo = SawoUtils.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "IP Address Tracker",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _login(),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    _sawo?.signIn(
      context: context,
      identifierType: "phone_number_sms",
      callback: _callback,
    );
  }

  void _callback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      Get.snackbar("Alert !", "Login failed. Please try aganin.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Color(0xFFFF8A80));
    }
    debugPrint("Login successful.");
    Get.offNamed('/homeActivity', arguments: {});
  }


}
