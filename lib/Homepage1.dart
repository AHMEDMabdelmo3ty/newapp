import 'dart:convert';
import 'dart:io';
import 'Defaults.dart';
import 'package:untitled3/api/books_api.dart';
import 'package:untitled3/model/book.dart';
import 'package:untitled3/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/main.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/Info.dart';
import 'package:untitled3/LogIn.dart';
import 'package:untitled3/DialogsExample.dart';
import 'package:untitled3/Signup.dart';
import 'package:untitled3/profile.dart';
import 'Info.dart';
import 'conn.dart';
import 'dart:async';

import 'package:untitled3/api/books_api.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/model/book.dart';
import 'package:untitled3/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/widget/infor.dart';

class Homepage1 extends StatefulWidget {
  Homepage1({Key? key}) : super(key: key);
  int _current = 0;

  List<Widget> childr = [
    /*  Text("apply"),
    Text("enter"),
    Text("exchange"),*/
    profile(),
    conn(),
  ];

  @override
  _Homepage1State createState() => _Homepage1State();
}

var indexClicked = 0;

class _Homepage1State extends State<Homepage1> {
  List<Book> books = [];
  bool isPressed = false;
  String query = '';
  late String a, b, c, d, e, f;
  Timer? debouncer;
  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getBooks(query);

    setState(() => this.books = books);
  }

  Function updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

  var company;
  var typework;
  var degree;
  var image;
  var job_description;
  //var dateTime = DateTime.parse("dateTimeString");

  final fromkey = GlobalKey<FormState>();
  List work = [
    {"company": "asal ", "work": "full time software eng", "degree": "master"},
    {"company": "exalt", "work": "full time software eng", "degree": "master"},
    {
      "company": "enfinit",
      "work": "full time software eng",
      "degree": "master"
    },
    {
      "company": "almostaqbal",
      "work": "full time software eng",
      "degree": "master"
    },
    {
      "company": "bank jordan",
      "work": "full time software eng",
      "degree": "master"
    }
  ];
  @override
  int selectedindex = 0;
  int _current = 0;
  final List<Widget> childr = [
    /*  Text("apply"),
    Text("enter"),
    Text("exchange"),*/
    profile(),
    conn(),
  ];
  void onTapBar(int index) {
    setState(() {
      _current = index;
      if (index == 0) {
        Navigator.of(context).pushNamed("profile");
      }
      if (index == 1) {
        Navigator.of(context).pushNamed("inst");
      }
    });
  }

  Widget build(BuildContext context) {
    childr[_current];
    return Scaffold(
      backgroundColor: Colors.white54,

      appBar: AppBar(
        title: Text('youre way to freelancre'),
        /*    leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),*/
        actions: [
          IconButton(
              onPressed: () {
                exit(0);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        shadowColor: Colors.pinkAccent,
        elevation: 10,
        backgroundColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   w.elementAt(selectedindex),
            Container(
                color: Colors.black,
                height: 300,
                child: PageView(
                  onPageChanged: (index) {
                    print(index);
                  },
                  children: [
                    // Text("kjhgfghjkl"),

                    Image.asset('images/5.jpg', fit: BoxFit.fill),
                    Image.asset('images/21.jpeg', fit: BoxFit.fill),
                    Image.asset('images/24.jpeg', fit: BoxFit.fill),
                    // Image.asset('images/8.jpg', fit: BoxFit.fill),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "Businesses available to apply for",
                style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: GridView.builder(
                itemBuilder: (context, index) {
                  final book = books[index];
                  return buildBook(book);
                },
                scrollDirection: Axis.vertical,
                itemCount: books.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 150.0,
                  mainAxisSpacing: 8.0,
                ),
              ),
            ),
            // Container(
            //      child: GridView.builder(
            //   gridDelegate: gridDelegate, itemBuilder: itemBuilder)),
            SizedBox(
              height: 10,
            ),
/*
            Container(
              child: Text(
                "كافة الخدمات المتاحة ",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
                // height: 20,
                //   margin: const EdgeInsets.all(12.0),

                //width: 10,
                /* child: GridView.builder(
                  //   scrollDirection: Axis.horizontal,
                  itemCount: work.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      //   margin: EdgeInsets.all(10),
                      child: ListTile(
                        tileColor: Colors.pinkAccent,
                        title: Text(
                          "111",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "work: ",
                          style: TextStyle(
                            //   color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                        textColor: Colors.black,
                        leading: CircleAvatar(),
                      ),
                    );
                  }),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (context, i) {
                      return Container(
                        //   margin: EdgeInsets.all(10),
                        child: ListTile(
                          tileColor: Colors.pinkAccent,
                          title: Text(
                            "111",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "work: ",
                            style: TextStyle(
                              //   color: Colors.blueGrey,
                              fontSize: 16,
                            ),
                          ),
                          textColor: Colors.black,
                          leading: CircleAvatar(),
                        ),
                      );
                    })
                    */

                ),
            Container(
              child: Text(
                "كيف يعمل هذا التطبييق ؟",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              child: Image.asset("images/88.jpg", fit: BoxFit.fill),
            ),
         */
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/5.jpg', fit: BoxFit.fill),

                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/21.jpeg', fit: BoxFit.fill),

                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/24.jpeg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/8.jpg', fit: BoxFit.fill),

                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  /*GridView.builder(
                      //   scrollDirection: Axis.horizontal,
                      itemCount: work.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 30,
                      ),
                      itemBuilder: (context, i) {
                        return Container(
                          //   margin: EdgeInsets.all(10),
                          child: ListTile(
                            tileColor: Colors.pinkAccent,
                            title: Text(
                              "111",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text(
                              "work: ",
                              style: TextStyle(
                                //   color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                            ),
                            textColor: Colors.black,
                            leading: CircleAvatar(),
                          ),
                        );
                      }),*/
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                          
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 100,
                        width: 100,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            Text("kjhgfghjkl"),

                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 50.0,
                      width: 200.0,
                    ),
                  ),*/
                Container(),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Container(
              child: Text("Contact us at"),
            ),

            SizedBox(
              height: 10,
            ),
/*
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('images/11.jpg'),
                ),
              ),
            ),
            Container(
              child: Text("Google account"),
            ),
            SizedBox(
              height: 10,
            ),

            Column(
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('images/10.jpg'),
                    ),
                  ),
                ),
                Container(
                  child: Text("facebook account"),
                ),
              ],
            ),*/
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/10.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("facebook account"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('images/11.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("google account"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.pink[100],
        backgroundColor: Colors.pinkAccent,
        currentIndex: _current,
        onTap: onTapBar,
        items: [
          BottomNavigationBarItem(
              label: "applay for a job",
              icon: Icon(Icons.work),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              label: "add work", icon: Icon(Icons.workspaces)),
        ],
      ),
      //
      //  padding: EdgeInsets.all(10),

      drawerScrimColor: Colors.white54,
      drawer: Drawer(
        backgroundColor: Colors.white38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundColor: Colors.white54,
                      backgroundColor: Colors.pink,
                      child: Text("user name"),
                    ),
                    const SizedBox(
                        //height: 10,
                        ),
                    //   arrowColor: Colors.black,
                    //  Text("LogIn"),
                    Text("profile_email@gmail.com"),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("Home page"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("help page"),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text("about page"),
              leading: Icon(Icons.help_center),
              onTap: () {
                Navigator.of(context).pushNamed("Succ");
              },
            ),
            ListTile(
              title: Text("Logout page"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                exit(0);
              },
            ),
            ListTile(
              title: Text("add work"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushNamed("conn");
              },
            ),
            ListTile(
              title: Text("applay to work"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushNamed("profile");
              },
            ),
            ListTile(
              title: Text("search work"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushNamed("FilterNetworkListPage");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Defaults.drawerItemColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  final int index;
  final Function onTap;
  const AppDrawerTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        //  onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }
}

Widget buildBook(Book book) => Container(
      color: Colors.pink[200],
      child: GridTile(
        header: Text(book.spicalicaition),
        child: Column(
          children: [
            Text(book.place),
            Text(book.date),
            Text(book.price),
            Text(book.type_work),
            Text(book.company),
            Text(book.job_description),
            RaisedButton(
              color: Colors.pinkAccent,
              textColor: Colors.white,
              onPressed: () {
                //   Navigator.of(context).pushNamed("Homepage");
              },
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                "applay  ",
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
