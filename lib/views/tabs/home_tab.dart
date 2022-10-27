import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';

class HomeTab extends StatefulWidget {
  final String uid;
  const HomeTab({Key? key, required this.uid}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController? _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 86, left: 20, bottom: 20),
            width: 414,
            color: const Color(0xff04497B),
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
                        height: 100,
                        child: TabBar(
                          isScrollable: true,
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
                  width: 200,
                  height: 120,
                  child: TabBarView(
                    physics: ScrollPhysics(),
                    controller: _tabController,
                    children: [
                      Text(
                        "Nutrition, Lifting, And Healthy Diet Plans For Football Players",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white, fontFamily: 'Poppins'),
                      ),
                      Text(
                        "Nutrition, Lifting, And Healthy Diet Plans For Football Players",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white, fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    MyText(
                      text: "28 Oct 2021",
                      size: 12,
                      weight: FontWeight.w400,
                      color: kWhiteColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      "assets/icons/share_icon.svg",
                      height: 18,
                      width: 15,
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 47,
          ),
          SingleChildScrollView(
            child: Container(
              height: 350,
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
      height: 122,
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
                size: 16,
                weight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
              MyText(
                text: "When it comes to fueling a football player there is\nunequivocally no one size fits all nutrition plan",
                size: 8,
                weight: FontWeight.w400,
                color: Colors.grey,
                fontFamily: 'Roboto',
              ),
              Row(
                children: [
                  MyText(
                    text: "28 Oct 2021",
                    size: 12,
                    weight: FontWeight.w400,
                    color: Colors.grey,
                    fontFamily: 'Roboto',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    "assets/icons/share_icon.svg",
                    color: Colors.grey,
                    height: 18,
                    width: 15,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            width: 26,
          ),
          Container(
            height: 98,
            width: 144,
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
