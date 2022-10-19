import 'package:feuzion/core/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/my_text.dart';
import '../../core/widgets/text_button.dart';

class PlayerTechnicalForm extends StatefulWidget {
  const PlayerTechnicalForm({Key? key}) : super(key: key);

  @override
  State<PlayerTechnicalForm> createState() => _PlayerTechnicalFormState();
}

class _PlayerTechnicalFormState extends State<PlayerTechnicalForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            title: "T.A.P.E.S",
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.only(top: 27, left: 20, right: 20),
            margin: EdgeInsets.only(top: 85, right: 16, left: 16),
            width: 383.w,
            height: 527.h,
            color: Color(0xffF4F5FA),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: MyText(
                    text: "Technical",
                    size: 20.sp,
                    weight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(
                  height: 55.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Touch",
                      size: 18.sp,
                      color: kBlackColor,
                      weight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    _TextForm(
                      labelText: 'Enter Value',
                    )
                  ],
                ),
                SizedBox(
                  height: 28.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Touch",
                      size: 18.sp,
                      color: kBlackColor,
                      weight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    _TextForm(
                      labelText: 'Enter Value',
                    ),
                    SizedBox(height: 66.h),
                    InkWell(
                      onTap: () => Get.back(),
                      child: TextButtonWidget(
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class _TextForm extends StatelessWidget {
  final labelText;
  const _TextForm({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: InputStyling.textStyle,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        contentPadding: InputStyling.padding,
        labelText: "$labelText",
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        hintText: '',
        hintStyle: InputStyling.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.4),
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: Color(0xff3DA9FC),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
