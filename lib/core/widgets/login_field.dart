// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

class LoginFields extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  var hintText, prefixIcon;
  bool? obSecure;
  TextEditingController? controller = TextEditingController();
  ValueChanged<String>? onChanged;
  var fieldValidator;
  var onSavedState;

  LoginFields(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.controller,
      this.obSecure = false,
      this.prefixIcon,
      this.fieldValidator,
      this.onSavedState})
      : super(key: key);

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
          // onSaved: (value){
          //   onS
          // },
          style: InputStyling.textStyle,
          obscureText: widget.obSecure!,
          controller: widget.controller,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon == null
                ? null
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '${widget.prefixIcon}',
                        height: 15,
                      )
                    ],
                  ),
            hintText: '${widget.hintText}',
            hintStyle: InputStyling.hintStyle,
            contentPadding: InputStyling.padding,
            border: InputStyling.inputEnableBorder,
            enabledBorder: InputStyling.inputEnableBorder,
            focusedBorder: InputStyling.inputFocusBorder,
            fillColor: Colors.white,
            filled: true,
          ),
          validator: widget.fieldValidator,
        ),
      ),
    );
  }
}
