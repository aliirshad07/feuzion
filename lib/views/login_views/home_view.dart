import 'package:feuzion/controllers/home_controller.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/colors.dart';

HomeViewController controller = Get.put(HomeViewController());

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 86.h, left: 20.w, bottom: 20),
            width: 414.w,
            color: Color(0xff04497B),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Get.width / 1.2,
                        height: 100.h,
                        child: TabBar(
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                          ),
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.grey,
                          indicatorPadding: EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: "Diet Tips",
                            ),
                            Tab(
                              text: "Exercise Suggestions",
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200.w,
                  height: 120.h,
                  child: TabBarView(
                    physics: ScrollPhysics(),
                    controller: _tabController,
                    children: [
                      Text(
                        "Nutrition, Lifting, And Healthy Diet Plans For Football Players",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Nutrition, Lifting, And Healthy Diet Plans For Football Players",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24.sp,
                            color: Colors.white,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    MyText(
                      text: "28 Oct 2021",
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: kWhiteColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SvgPicture.asset(
                      "assets/icons/share_icon.svg",
                      height: 18.h,
                      width: 15.w,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 47.h,
          ),
          SingleChildScrollView(
            child: Container(
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return _NewsContainer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsContainer extends StatelessWidget {
  const _NewsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 1, bottom: 5),
      margin: EdgeInsets.only(bottom: 10),
      height: 122.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
            ),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "A Guide to Proper Nutrition\nfor Football Players",
                size: 16.sp,
                weight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
              MyText(
                text:
                    "When it comes to fueling a football player there is\nunequivocally no one size fits all nutrition plan",
                size: 8.sp,
                weight: FontWeight.w400,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
              Row(
                children: [
                  MyText(
                    text: "28 Oct 2021",
                    size: 12.sp,
                    weight: FontWeight.w400,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/icons/share_icon.svg",
                    color: Colors.grey,
                    height: 18.h,
                    width: 15.w,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: 26.w,
          ),
          Container(
            height: 98.h,
            width: 144.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/juiceimagE.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
