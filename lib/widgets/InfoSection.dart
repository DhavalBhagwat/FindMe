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
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            value!,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

}
