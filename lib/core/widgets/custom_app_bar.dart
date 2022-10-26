import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_text.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 83,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
      title: MyText(
        text: '$title',
        size: 24,
        weight: FontWeight.w500,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);
}
