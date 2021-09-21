import 'package:findme/utils/Styles.dart';
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
            style: Styles.keyStyle(),
          ),
          SizedBox(height: 4.0),
          Text(
            value!,
            textAlign: TextAlign.center,
            style: Styles.valueStyle(),
          ),
        ],
      ),
    );
  }

}
