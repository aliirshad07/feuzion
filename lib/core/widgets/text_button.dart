import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: 58.h,
      width: 374.w,
      color: Color(0xff04497A),
      child: Center(
        child: MyText(
          text: "$text",
          color: kWhiteColor,
          weight: FontWeight.w500,
          fontFamily: 'Roboto',
          size: 24.sp,
        ),
      ),
    );
  }
}
