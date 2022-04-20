import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled3/Info.dart';

class ProfileScreen extends StatefulWidget {
  static String tag = '/NBProfileScreen';

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

   int rating =4;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        physics: ScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 590,
              backgroundColor: Colors.blueAccent,
              title: Text(
                'Profile',
              ),
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg'),
                        radius: 50,
                      ),
                      const SizedBox(height: 8),

                      Text(
                        '@zeyadtareq',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              getStar(rating, 1),
                              Text('مقبول',  style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ),SizedBox(width: 15,),
                          Column(
                            children: [
                              getStar(rating, 2),
                              Text('جيد',  style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ),SizedBox(width: 15,),
                          Column(
                            children: [
                              getStar(rating, 3),
                              Text('جيد جدا',  style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ),SizedBox(width: 15,),
                          Column(
                            children: [
                              getStar(rating, 4),
                              Text('ممتاز',  style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ),SizedBox(width: 15,),
                          Column(
                            children: [
                              getStar(rating, 5),
                              Text('ممتاز جدا',  style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),)
                            ],
                          ),


                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.card_travel,color:Colors.black ,),

                              SizedBox(width: 10,),Text(
                          "See cv",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                      ),

                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                primary: Colors.white

                        ),
                      ),


                      SizedBox(height: 20),
                      Column(
                        children: [
                          ProfileWidget(
                              title: 'Email:', value: 'zeyadtareq@gmail.com'),
                          ProfileWidget(
                              title: 'Phone:', value: '+970 5-955-955-95'),
                        ],
                      ),
                      // SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(
                    text: 'All Works',
                  ),
                  Tab(text: 'My Works'),
                ],
                labelStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                // labelColor: black,
                // unselectedLabelStyle: primaryTextStyle(),
                unselectedLabelColor: Colors.grey.shade300,
                isScrollable: true,
                indicatorWeight: 3,
                // indicatorColor: NBPrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String title;
  final String value;
  const ProfileWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueAccent.shade400,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade300,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      margin: EdgeInsets.only(right: 12, left: 12, bottom: 8),
      padding: EdgeInsets.all(18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
Widget getStar(rating, index) {
  if (rating >= index) {
    return Icon(Icons.star, color: Color(0xffFF9A0D),size: 30,);
  } else {
    return Icon(Icons.star_border_outlined, color: Colors.grey,size: 30,);
  }

}