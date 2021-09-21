import 'package:findme/utils/Styles.dart';
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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/pattern-bg.png"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "IP Address Tracker",
                  style: Styles.titleStyle(),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Styles.darkGrey),
                  ),
                  onPressed: () => _login(),
                  child: Text(
                      "Login",
                      style: Styles.loginButtonStyle()
                  ),
                ),
              ],
            ),
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
      Get.snackbar("Alert !", "Login failed. Please try again.", snackPosition: SnackPosition.BOTTOM, backgroundColor: Styles.lightRed);
    }
    debugPrint("Login successful.");
    Get.offNamed('/homeActivity', arguments: {});
  }


}
