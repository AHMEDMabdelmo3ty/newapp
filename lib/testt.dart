import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled3/LogIn.dart';
import 'info.dart';
import 'logIn.dart';

class testt extends StatelessWidget {
  var company;
  var typework;
  var degree;
  var image;
  //var dateTime = DateTime.parse("dateTimeString");

  List work = [
    {
      "company": "asal ",
      "work": "full time software eng",
      "degree": "master",
      "iamge": "images/20.jpg"
    },
    {"company": "exalt", "work": "full time software eng", "degree": "master"},
    {
      "company": "enfinit",
      "work": "full time software eng",
      "degree": "master",
      "iamge": "images/21.jpeg"
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' List of work '),
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
      body: Container(
        // height: 20,
        margin: const EdgeInsets.all(12.0),

        //width: 10,
        child: GridView.builder(
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
                    "${work[i]['company']}",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    "work:  ${work[i]['work']},  degree:${work[i]['degree']}",
                    style: TextStyle(
                      //   color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                  ),
                  textColor: Colors.black,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("${work[i]['iamge']}"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
