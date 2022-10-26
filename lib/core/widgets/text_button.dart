import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import 'my_text.dart';

class TextButtonWidget extends StatelessWidget {
  final text;
  const TextButtonWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 374,
      color: Color(0xff04497A),
      child: Center(
        child: MyText(
          text: "$text",
          color: kWhiteColor,
          weight: FontWeight.w500,
          fontFamily: 'Roboto',
          size: 24,
        ),
      ),
    );
  }
}
