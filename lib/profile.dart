import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled3/LogIn.dart';
import 'info.dart';
import 'logIn.dart';
import 'package:untitled3/page/filter_network_list_page.dart';

class profile extends StatelessWidget {
  // var Name = LogIn().usernam;
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  List _cities = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Austrian Empire*",
    "Azerbaijan",
    "palestine"
  ];
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
      DropdownMenuItem(child: Text("palestine"), value: "palestine"),
      DropdownMenuItem(child: Text("egypt"), value: "egypt"),
      DropdownMenuItem(child: Text("jordan"), value: "jordan"),
    ];
    return menuItems;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('applay for a job'),
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
      //   resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          color: Colors.black38,

          child: Container(
            color: Colors.black12,
            padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    //   height: 20,
                    width: 10,
                  ),
                  Container(
                    height: 400,
                    width: 150,
                    child: Column(
                      children: [
                        TextFormField(
                          //   controller: usernam,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "degree",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            //  filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          //   width: 10,
                        ),
                        TextFormField(
                          //   controller: usernam,

                          obscureText: false,

                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "spicalicaition",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),

                            //  filled: true,
                          ),
                        ),
                        //  Text("are you instittion ? add your work"),
                        SizedBox(
                          height: 1,
                          //   width: 40,
                        ),
                        Container(
                            child: RaisedButton(
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("FilterNetworkListPage");
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            "Search ",
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                        SizedBox(
                          height: 5,
                          width: 10,
                        ),

                        Container(
                          child: Row(
                            children: [
                              Text(
                                "are you instittion ?  ",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),

                              ///  Text("dont have an account ?  "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("conn");
                                },
                                child: Text(
                                  "add your work",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    // fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Container(
                    key: _dropdownFormKey,
                    height: 400,
                    width: 150,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintText: "place",
                              filled: true,
                              // fillColor: Colors.blueAccent,
                            ),
                            validator: (value) =>
                                value == null ? "Select a country" : null,
                            dropdownColor: Colors.pinkAccent,
                            value: selectedValue,
                            onChanged: (String? newValue) {},
                            items: dropdownItems),
                        TextFormField(
                          //   controller: usernam,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "type of work",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            //  filled: true,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 5,
                        ),
                        Container(
                            child: RaisedButton(
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed("FilterNetworkListPage");
                          },
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            "Search by keyword",
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                      ],
                    ),
                  ),
                ]),
          ),
          //   child:Container(),
        ),
      ),
    );
  }
}
