import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';
import '../constants.dart';
import 'my_text.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var labelText, hintText, suffixIcon;
  bool? obSecure, haveSuffixIcon, isReadOnly;
  double? suffixIconSize;
  int? maxLines;
  TextEditingController? controller = TextEditingController();
  ValueChanged<String>? onChanged;
  VoidCallback? onSuffixTap, onTap;
  TextInputType keyboardType;
  var fieldvalidator;
  MyTextField({
    Key? key,
    this.labelText,
    this.hintText = '',
    this.maxLines = 1,
    this.onChanged,
    this.controller,
    this.obSecure = false,
    this.haveSuffixIcon = false,
    this.isReadOnly = false,
    this.suffixIcon,
    this.suffixIconSize,
    this.onSuffixTap,
    this.onTap,
    this.fieldvalidator,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: InputStyling.textStyle,
        keyboardType: keyboardType,
        obscureText: obSecure!,
        maxLines: maxLines,
        obscuringCharacter: "*",
        readOnly: isReadOnly!,
        onTap: onTap,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white,
          filled: true,
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              haveSuffixIcon == true
                  ? GestureDetector(
                      onTap: onSuffixTap,
                      child: Image.asset(
                        '$suffixIcon',
                        height: suffixIconSize ?? 17,
                      ),
                    )
                  : const SizedBox(
                      width: 1,
                    ),
            ],
          ),
          contentPadding: InputStyling.padding,
          labelText: '$labelText',
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kHintTextColor,
          ),
          hintText: '$hintText',
          hintStyle: InputStyling.hintStyle,
          border: InputStyling.inputEnableBorder,
          enabledBorder: InputStyling.inputEnableBorder,
          focusedBorder: InputStyling.inputFocusBorder,
        ),
        validator: fieldvalidator,
      ),
    );
  }
}

// ignore: must_be_immutable
class PaymentFields extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var labelText, hintText, suffixIcon;
  bool? obSecure, haveSuffixIcon;
  double? suffixIconSize;
  TextEditingController? controller = TextEditingController();
  ValueChanged<String>? onChanged;

  PaymentFields({
    Key? key,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.controller,
    this.obSecure = false,
    this.haveSuffixIcon = false,
    this.suffixIcon,
    this.suffixIconSize,
  }) : super(key: key);

  @override
  _PaymentFieldsState createState() => _PaymentFieldsState();
}

class _PaymentFieldsState extends State<PaymentFields> {
  Color? labelColor = kInputTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        onChanged: widget.onChanged,
        style: InputStyling.textStyle,
        obscureText: widget.obSecure!,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.haveSuffixIcon == true
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        '${widget.suffixIcon}',
                        height: widget.suffixIconSize ?? 17,
                      ),
                    )
                  : const SizedBox(
                      width: 1,
                    ),
            ],
          ),
          contentPadding: InputStyling.padding,
          labelText: '${widget.labelText}',
          labelStyle: const TextStyle(
            fontSize: 16,
            color: kHintTextColor,
          ),
          hintText: '${widget.hintText}',
          hintStyle: InputStyling.hintStyle,
          enabledBorder: InputStyling.inputEnableBorder,
          focusedBorder: InputStyling.inputEnableBorder,
        ),
      ),
    );
  }
}
