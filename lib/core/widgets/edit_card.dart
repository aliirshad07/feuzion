import 'package:flutter/material.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
class editCard extends StatelessWidget {

  final String title;
  final int initialValue;
  final Function(num) onChanged;
  const editCard({Key? key, required this.title, required this.initialValue, required this.onChanged}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: 60,
        width: double.infinity,
        color: Color(0xffF4F5FA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: "$title",
              size: 20,
              weight: FontWeight.w500,
              color: Color(0xff323F4B),
              fontFamily: 'Roboto',
            ),
            ElegantNumberButton(
              initialValue: initialValue,
              minValue: 0,
              maxValue: 100,
              onChanged: onChanged,
              decimalPlaces: 0,
              step: 1.0,
              buttonSizeHeight: 40,
              buttonSizeWidth: 40,
              color: Colors.blueAccent,
              textStyle: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}