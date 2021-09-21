import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InfoSection extends StatelessWidget {
  final String? title, value;

  InfoSection({
    @required this.title,
    @required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: [
          Text(
            title!,
            style: TextStyle(
                color: Color(0xFF969696),
                fontSize: 12.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            value!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF2B2B2B),
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

}
