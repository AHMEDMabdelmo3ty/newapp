import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'Mystring.dart';

//import 'package:untitled2/widgets/AuthButton.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  final fromkey = GlobalKey<FormState>();
  final TextEditingController usernam = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  bool remmember = false;

  Future Signup() async {
    var url = 'http://192.168.1.78/login_signup/register.php';
    var response = await http.post(Uri.parse(url), body: {
      "user": usernam.text,
      "email": email.text,
      "password": pass.text,
    });

    print("data");
    var data = json.decode(json.encode(response.body));

    // ignore: avoid_print

    if (data == "error") {
      Fluttertoast.showToast(
          msg: "This User Already Exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.of(context).pushNamed("Homepage1");
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
      //backgroundColor: Colors.white,
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
        child: Form(
          key: fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  padding: EdgeInsets.all(20),

                  //padding: EdgeInsets.symmetric(vertical: 10.0),
                  height: 200,
                  width: 300,
                  //  alignment: Alignment.topCenter,
                  child: Image.asset("images/3.png")),
              Center(
                child: Row(
                  children: [
                    Container(
                      //  alignment: Alignment.topRight,
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "   SIGN",
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "UP",
                        // textAlign: TextAlign.end,
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1.0),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: usernam,
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            RegExp(validationName).hasMatch(value!)) {
                          return 'Enter valid name';
                        } else {
                          return null;
                        }
                      },
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
                      validator: (value) {
                        if (value.toString().length <= 6) {
                          return 'Enter valid pass';
                        } else {
                          return null;
                        }
                      },
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
                        //filled: true,
                      ),
                    ),
                    //  SizedBox(height: 3),
                    TextFormField(
                      controller: email,
                      obscureText: false,
                      validator: (value) {
                        if (!RegExp(validationName).hasMatch(value!)) {
                          return 'invlid email';
                        } else {
                          return null;
                        }
                      },
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade200,
                        prefixIcon: Icon(Icons.email),
                        hintText: "e_mail",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        // filled: true,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          //  padding: ,
                          child: Row(
                            children: [
                              Text("     if you have account  "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("LogIn");
                                },
                                child: Text(
                                  "click here",
                                  style: TextStyle(color: Colors.pinkAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      //width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.pinkAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          Signup();

                          //        Navigator.of(context).pushNamed("Homepage");
                        },
                        padding: EdgeInsets.symmetric(vertical: 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Text(
                          "Sign up ",
                          style: TextStyle(fontSize: 14),
                          //   Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    //   SizedBox(height: 10),
                    /*     TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "First Name",
                          border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Last Name",
                          border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),*/
                    /*
                        Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () => print('forget password button pressed'),
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
                   
                   
                   */

                    Container(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Theme(
                              data: ThemeData(
                                  unselectedWidgetColor: Colors.black),
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
                            Text(
                              'i accepet all terms & setting',
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(child: Row()),

                    /*  Row(
                        children: <Widget>[
                         //SizedBox
                          // Text("I accpet terms and condation"),
                          // TextFormField(
                          //    style: TextStyle(fontSize: 17.0),
                          //   ), //Text
                          //   SizedBox(width: 10), //SizedBox
                          /** Checkbox Widget **/
                          /*  CheckboxListTile(
                          title: Text(),
                          onChanged: (bool? value) {},
                          value: null,
                        ),*/ //Checkbox
                        ], //<Widget>[]
                      ),*/
                  ],
                )),
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
                  Text('signup With '),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
