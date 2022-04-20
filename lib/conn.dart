import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled3/LogIn.dart';

import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';

class conn extends StatefulWidget {
  const conn({Key? key}) : super(key: key);

  @override
  State<conn> createState() => _connState();
}

class _connState extends State<conn> with SingleTickerProviderStateMixin {
  late final da = TextEditingController();
  final cn = TextEditingController();
  final sp = TextEditingController();
  final pl = TextEditingController();
  final tw = TextEditingController();
  final pr = TextEditingController();
  final jd = TextEditingController();

  int i = 0;
  bool visible = false;
  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  Future Inst() async {
    bool visible = false;
    setState(() {
      visible = true;
    });
    var url = 'http://192.168.1.78/login_signup/inst.php';

    var response = await http.post(Uri.parse(url), body: {
      "date": da.text,
      "company": cn.text,
      "spicalicaition": sp.text,
      "place": pl.text,
      "type_work": tw.text,
      "price": pr.text,
      "job_description": jd.text,
    });
    //print("data");
    var message = jsonDecode(response.body);
    var data = json.decode(response.body);
    // ignore: avoid_print
    // print(data);
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
      // Navigator.of(context).pushNamed("Homepage");
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  late AnimationController _controller;
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add your work'),
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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: 400,
          height: 700,

          // padding: EdgeInsets.all(100),
          child: Container(
            color: Colors.black12,
            padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 150,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: cn,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "Company name ",
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
                          controller: sp,
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
                        TextFormField(
                          //   controller: usernam,
                          controller: da,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "date",

                            prefixIcon: IconButton(
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(2030),
                                  ).then((DateTime? value) {
                                    if (value != null) {
                                      DateTime _fromDate = DateTime.now();
                                      _fromDate = value;
                                      final String date =
                                          DateFormat.yMMMd().format(_fromDate);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Selected date: $date')),
                                      );
                                      da.text = date;
                                    }
                                  });
                                },
                                icon: Icon(Icons.date_range)),
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            //  filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                          width: 10,
                        ),
                        Container(
                          width: 400,
                          child: TextFormField(
                            controller: jd,
                            obscureText: false,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              //   prefixIcon: Icon(Icons.person),
                              hintText: "Job description",
                              hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                              //  filled: true,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Container(
                            child: RaisedButton(
                          color: Colors.pinkAccent,
                          textColor: Colors.white,
                          onPressed: Inst,
                          //   Navigator.of(context).pushNamed("Homepage");

                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            "add ",
                            style: TextStyle(fontSize: 14),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Container(
                    key: _dropdownFormKey,
                    height: 300,
                    width: 150,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: pl,
                          obscureText: false,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                            //   prefixIcon: Icon(Icons.person),
                            hintText: "place",
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            //  filled: true,
                          ),
                        ),
                        TextFormField(
                          controller: tw,
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
                          child: TextFormField(
                            controller: pr,
                            obscureText: false,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              hintText: "price",
                              hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),

                              //  filled: true,
                            ),
                          ),
                        ),

/*
 ListView(
      padding: const EdgeInsets.all(32.0),
      children: <Widget>[
        const Text('Simple dialog'),

        ////// Date Picker Dialog.
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue,
          
          ),
       
          child: const Text('Date Picker Dialog'),
        ),
        ////// DateRange Picker Dialog.
      ]
          .map(
            (Widget button) => Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: button,
            ),
          )
          .toList(),
    );

*/
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
