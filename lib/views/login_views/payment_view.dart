import 'package:feuzion/controllers/payment_view_controller.dart';
import 'package:feuzion/core/colors.dart';
import 'package:feuzion/core/widgets/form_validators.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:feuzion/core/widgets/my_text_field.dart';
import 'package:feuzion/views/login_views/payment_successful_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/constants.dart';
import '../../core/routes/app_pages.dart';

PaymentViewController controller = Get.put(
  PaymentViewController(),
);

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kScaffoldBkgDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 153.0, left: 20, right: 20),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Add Card Details",
                  size: 24.sp,
                  color: kWhiteColor,
                  weight: FontWeight.w400,
                  fontFamily: 'Roboto',
                ),
                SizedBox(
                  height: 40.h,
                ),
                _paymentViewTextField(
                  fieldValidator: nameValidator,
                  controller: controller.emailController,
                  labelText: "Name on Card",
                ),
                SizedBox(
                  height: 32.h,
                ),
                _paymentViewTextField(
                  fieldValidator: cardValidator,
                  controller: controller.cardnumberController,
                  labelText: "Card Number",
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 148.72.w,
                      child: TextField(
                        readOnly: true,
                        style: InputStyling.textStyle,
                        controller: controller.dobController,
                        decoration: InputDecoration(
                          hintText: 'Expiry Date ',
                          hintStyle: InputStyling.hintStyle,
                          contentPadding: InputStyling.padding,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF5467)),
                          ),
                        ),
                        onTap: () async {
                          // hide keyboard
                          FocusScope.of(context).unfocus();
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                    primaryColor: kSecondaryColor,
                                    accentColor: kSecondaryColor,
                                    colorScheme: const ColorScheme.light(
                                        primary: kSecondaryColor)),
                                child: child!,
                              );
                            },
                          );
                          controller.dobChanged(date);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 81.w,
                    ),
                    SizedBox(
                      width: 144.01.w,
                      child: _paymentViewTextField(
                        fieldValidator: cvvValidator,
                        controller: controller.cvvnumberController,
                        labelText: 'CVV',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 90.h,
                ),
                InkWell(
                  onTap: () => Get.toNamed(Routes.PAYMENTSUCCESSFUL),
                  child: _LockButtonPaymentView(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LockButtonPaymentView extends StatelessWidget {
  const _LockButtonPaymentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      width: 374.w,
      color: Color(0xff04497A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/lock_icon.svg"),
          SizedBox(
            width: 13.w,
          ),
          MyText(
            text: "Pay £19",
            color: kWhiteColor,
            weight: FontWeight.w700,
            fontFamily: 'Roboto',
            size: 24.sp,
          )
        ],
      ),
    );
  }
}

class _paymentViewTextField extends StatelessWidget {
  final labelText;
  TextEditingController? controller = TextEditingController();
  var fieldValidator;
  ValueChanged<String>? onChanged;

  _paymentViewTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.fieldValidator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: fieldValidator,
      style: TextStyle(color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
        labelText: "$labelText",
        labelStyle: new TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffFF5467)),
        ),
      ),
    );
  }
}
