import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Succ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          //  Column(),
          Container(
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('images/12.jpg'),
                    fit: BoxFit.fill)),
          ),

          Container(
            alignment: Alignment.center,
            child: Text(
              "  This application helps to increase job opportunities \nand exchange business between business owners and gives the opportunity for\n companies to present business on the site and choose the most suitable person. ✅",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            height: 400,
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top: 3, left: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  )),
              child: MaterialButton(
                child: Text(
                  "back",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => {
                  Navigator.of(context).pushNamed("Homepage"),
                },
                color: Colors.blue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ))
        ],
      ),
    );
  }
}
