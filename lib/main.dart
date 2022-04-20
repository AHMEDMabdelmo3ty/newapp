import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/info.dart';
import 'package:untitled3/profile_screen.dart';
import 'page/filter_network_list_page.dart';
import 'package:untitled3/profile.dart';
import 'LogIn.dart';
import 'Signup.dart';
import 'Succ.dart';
import 'Welcomescreen.dart';
import 'Homepage.dart';
import 'Homepage1.dart';
import 'ForgotPasswordScreen.dart';
import 'AppBarSearchExample.dart';
import 'profile.dart';
import 'testt.dart';
import 'conn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(myapp());
}

// ignore: camel_case_types, use_key_in_widget_constructors
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
      theme: ThemeData(
          primaryColor: Colors.blue,
          buttonColor: Colors.blue,
          textTheme: TextTheme(
              headline6: TextStyle(fontSize: 20, color: Colors.white))),
      routes: {
        "Welcomescreen": (context) => Welcomescreen(),
        "LogIn": (context) => LogIn(),
        "Signup": (context) => Signup(),
        "Homepage": (context) => Homepage(),
        "Homepage1": (context) => Homepage1(),
        "Succ": (context) => Succ(),
        "profile": (context) => profile(),
        "info": (context) => Test(),
        "ForgotPasswordScreen": (context) => ForgotPasswordScreen(),
        "FilterNetworkListPage": (context) => FilterNetworkListPage(),
        "AppBarSearchExample": (context) => AppBarSearchExample(),
        "testt": (context) => testt(),
        "inst": (context) => conn(),
        // "DialogsExample": (context) => DialogsExample(),
        //  "trr": (context) => AppBarSearchExample(),
      },
      //الصفحة يلي بدي اعرضها بحطها داخل الهوم
    );
  }
}
/*
class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(),
        body: Container(
            height: double.infinity,
            width: double.infinity, //الطول والعرض
            margin: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0), // في fromel trb عشان اضيف البعد عن كل الحواف بس بالترتيب موجودة بالفيديو البعد عن الحواف
            decoration: BoxDecoration(
                color: Colors.black, //لون الكونتينر
                // image: DecorationImage(
                //  image: NetworkImage(
                //   "https://i.ytimg.com/vi/c4XoXH4oF-I/maxresdefault.jpg") //في نوعين بقدر اضيفها من الانترنت او من خلال الجهاز
                // image: AssetImage("images/1.jpg"))),
                padding: EdgeInsets.fromLTRB(100, 280, 100, 100),
                child: Text("welcome",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.green[600],
                        fontWeight: FontWeight.w500,
                        letterSpacing: 7.0, //المسافة بين الاحرف
                        wordSpacing: 7.0, //المسافة بين الكلمات
                        decoration: TextDecoration.lineThrough, //التحكم بالخط
                        backgroundColor: Colors.green[400], //خلفية الخط
                        shadows: [
                          Shadow(
                              color: Colors.green,
                              offset: Offset(20.0, 20.0),
                              blurRadius: 10.0),
                        ])))));
  }
}
*/

// ignore: camel_case_types, use_key_in_widget_constructors
class welcome extends StatelessWidget {
  //البييانات
  @override
  Widget build(BuildContext context) {
    //محتويات التصمييم
    return Scaffold(
      // appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(100, 350, 100, 200),
        child: Text("welcome",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35,
              color: Colors.green[600],
              fontWeight: FontWeight.w500,
              letterSpacing: 7.0, //المسافة بين الاحرف
              wordSpacing: 7.0, //المسافة بين الكلمات

              //  decoration: TextDecoration.lineThrough, //التحكم بالخط
              //  backgroundColor: Colors.green[400], //خلفية الخط
            )),
      ),
    );
  }
}

// ignore: camel_case_types, use_key_in_widget_constructors
class lgin extends StatelessWidget {
  //البييانات
  @override
  Widget build(BuildContext context) {
    //محتويات التصمييم
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body: Text("log in"),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildPages(),
      );

  Widget buildPages() {
    return FilterNetworkListPage();
  }
}
