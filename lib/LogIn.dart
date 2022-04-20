import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled3/LogIn.dart';
import 'Signup.dart';
//import 'package:untitled2/second/Homepage.dart';

import 'package:http/http.dart' as http;

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  TextEditingController usernam = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool remmember = false;

  Future LogIn() async {
    print("data");

    var url = 'http://192.168.1.78/login_signup/login.php';
    var response = await http.post(Uri.parse(url), body: {
      "user": usernam.text,
      "password": pass.text,
    });

    print("data");
    var data = json.decode(json.encode(response.body));

    //print("data");
    // ignore: avoid_print
    // print(data);
    if (data == "success") {
      Fluttertoast.showToast(
          msg: "Login successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).pushNamed("Homepage1");
    } else {
      Fluttertoast.showToast(
          msg: "username & password incorrect!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  late AnimationController _controller;

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff73ef5),
              Color(0xf61a4f1),
              Color(0XFF478DE0),
              Color(0XFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 105,
              child: Image.asset("images/3.png"),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  child: Column(
                children: [
                  Text(
                    "LogIn",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: Colors.pinkAccent,
                    ),
                  ),

                  TextFormField(
                    controller: usernam,
                    obscureText: false,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      prefixIcon: Icon(Icons.person),
                      hintText: "User Name",
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      //  filled: true,
                    ),
                  ),

                  TextFormField(
                    controller: pass,
                    obscureText: false,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      //   suffixIcon: //IconButton(
                      //     onPressed: (){

                      //  },
                      // icon: Icon(Icons.visibility_off),
                      //  ),
                      //filled: true,
                    ),
                  ),
                  //  SizedBox(height: 10),
                  // const Icon(Icons.lock, color: Colors.pink, size: 20),

                  //   SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        //  padding: ,
                        padding: EdgeInsets.symmetric(vertical: 10.0),

                        child: Row(
                          children: [
                            Text("     if you have't account  "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("Signup");
                              },
                              child: Text(
                                "click here",
                                style: TextStyle(color: Colors.blueAccent),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: RaisedButton(
                    color: Colors.pinkAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      //   Navigator.of(context).pushNamed("Homepage");
                      LogIn();
                    },
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(
                      "LOG IN ",
                      style: TextStyle(fontSize: 14),
                    ),
                  )),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("ForgotPasswordScreen");
                      },
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        'forget password?',
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.black),
                          child: Checkbox(
                            value: remmember,
                            checkColor: Colors.pinkAccent,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                remmember = value!;
                              });
                            },
                          ),
                        ),
                        Text('remember me'),
                      ],
                    ),
                  ),

                  Column(
                    children: <Widget>[
                      Text(
                        '_OR_',
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Login With '),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (

                              //  Navigation.of(context).

                              //   Navigator.of(context).pushNamed("Signup");

                              ) {
                            //Navigator.of(context).pushNamed(),
                          },
                          child: Container(
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
                        ),
                        GestureDetector(
                          onTap: (

                              //  Navigation.of(context).

                              //   Navigator.of(context).pushNamed("Signup");

                              ) {
                            //Navigator.of(context).pushNamed(),
                          },
                          child: Container(
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
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
