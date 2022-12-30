import 'package:feuzion/controllers/player_education_controller.dart';
import 'package:feuzion/controllers/player_technical_controller.dart';
import 'package:feuzion/core/widgets/edit_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/my_text.dart';
import '../../core/widgets/text_button.dart';
import 'package:feuzion/core/bindings.dart';

class PlayerEducationForm extends GetView<PlayerEducationController>{
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
              width: 383,
              height: 527,
              color: Color(0xffF4F5FA),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: MyText(
                        text: "Education",
                        size: 20,
                        weight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 60,),
                    Obx(() => editCard(
                      title: 'Touch',
                      initialValue: controller.initialTouch.value,
                      onChanged: (val){
                        controller.initialTouch.value = val.toInt();
                      },
                    ),
                    ),
                    Obx(() => editCard(
                      title: 'Intelligence',
                      initialValue: controller.initialIntelligence.value,
                      onChanged: (val){
                        controller.initialIntelligence.value = val.toInt();
                      },
                    ),
                    ),
                    SizedBox(height: 66),
                    InkWell(
                      onTap: () => Get.back(),
                      child: TextButtonWidget(
                        text: "Save",
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
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
