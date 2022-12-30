import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feuzion/core/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/collections.dart';
import '../../core/colors.dart';
import 'package:intl/intl.dart';

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
            padding: const EdgeInsets.only(left: 20, bottom: 20),
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
                  width: Get.width,
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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: newsCollection.orderBy("date", descending: true).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const SizedBox();

                  List<DocumentSnapshot> news = snapshot.data!.docs;

                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      return NewsContainer(news: news[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class NewsContainer extends StatelessWidget {
  const NewsContainer({Key? key, required this.news}) : super(key: key);

  final DocumentSnapshot news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black26)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: news["title"],
                  size: 16,
                  weight: FontWeight.w500,
                  maxLines: 2,
                  overFlow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
                MyText(
                  text: news["description"],
                  size: 8,
                  weight: FontWeight.w400,
                  color: Colors.grey,
                  fontFamily: 'Roboto',
                ),
                Row(
                  children: [
                    MyText(
                      text: DateFormat("dd MMM yyyy").format(news["date"].toDate()),
                      size: 12,
                      weight: FontWeight.w400,
                      color: Colors.grey,
                      fontFamily: 'Roboto',
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      "assets/icons/share_icon.svg",
                      color: Colors.grey,
                      height: 18,
                      width: 15,
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
          CachedNetworkImage(
            imageUrl: news["image"],
            fit: BoxFit.cover,
            height: 95,
            width: 140,
          ),
        ],
      ),
    );
  }
}
