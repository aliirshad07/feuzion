import 'package:flutter/material.dart';

import '../colors.dart';

// ignore: must_be_immutable
class MyButton extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text, weight,textColor,btnBgColor,radius;
  double? textSize, height,elevation;
  VoidCallback? onPressed;

  MyButton({Key? key,
    this.text,
    this.textSize = 18,
    this.textColor = kBlackColor,
    this.btnBgColor = kSecondaryColor,
    this.height = 59,
    this.elevation = 0,
    this.radius = 9.0,
    this.weight = FontWeight.w500,
    this.onPressed,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: kWhiteColor.withOpacity(0.1),
      highlightColor: kWhiteColor.withOpacity(0.1),
      elevation: widget.elevation,
      highlightElevation: widget.elevation,
      onPressed: widget.onPressed,
      color: widget.btnBgColor,
      height: widget.height,
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
      child: Text(
        '${widget.text}',
        style: TextStyle(
          fontSize: widget.textSize,
          color: widget.textColor,
          fontWeight: widget.weight,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
