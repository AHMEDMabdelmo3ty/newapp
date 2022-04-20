import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'login.dart';

var ip = "http://192.168.1.78:8000";

class Test extends StatefulWidget {
  //Test({Key? key}) : super(key: key);

  @override
  info createState() => info();
}

class info extends State<Test> with SingleTickerProviderStateMixin {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  var hight = "";
  var weight = "";
  var age = "";
  String gender = "";
  String activety = "";
  String msg1 = "the input is incorrect";
  String goal = "";
  var bmr;
  late num C;
  var C_taken = 0;
  calcuate() {
    var formdata = formstate.currentState;

    if (formdata!.validate()) {
      formdata.save();
      var hight_asnum = int.parse(hight);
      var weight_asNum = int.parse(weight);
      var age_asNum = int.parse(age);

      print("calories =$C");
    } else
      print("not available");
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          shadowColor: Colors.green,
          elevation: 0,
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formstate,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            padding: EdgeInsets.only(top: 10),
            children: [
              Text("choose your gender :-",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
              Row(
                children: [
                  Icon(
                    Icons.male_sharp,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text("Male",
                      style: TextStyle(fontSize: 20.0, color: Colors.green)),
                  Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: "male",
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.female_sharp,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text("Female",
                      style: TextStyle(fontSize: 20.0, color: Colors.green)),
                  Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: "female",
                      groupValue: gender,
                      onChanged: (val) {
                        setState(() {
                          gender = val!;
                        });
                      })
                ],
              ),
              Text("choose your body activity",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                  dense: true,
                  title: Text(
                    "Sedentary",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("little or no exerice",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                  value: "sedentary",
                  groupValue: activety,
                  onChanged: (val) {
                    setState(() {
                      activety = val!;
                    });
                  }),
              RadioListTile<String>(
                  dense: true,
                  title: Text("light",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("exercise 1-3 times/week",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                  value: "light",
                  groupValue: activety,
                  onChanged: (val) {
                    setState(() {
                      activety = val!;
                    });
                  }),
              RadioListTile<String>(
                  dense: true,
                  title: Text("Moderate",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("exercise 4-5 times/week",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                  value: "Moderate",
                  groupValue: activety,
                  onChanged: (val) {
                    setState(() {
                      activety = val!;
                    });
                  }),
              RadioListTile<String>(
                  dense: true,
                  title: Text("Very Active",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("intense exercise 6-7 times/week",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                  value: "very active",
                  groupValue: activety,
                  onChanged: (val) {
                    setState(() {
                      activety = val!;
                    });
                  }),
              RadioListTile<String>(
                  dense: true,
                  title: Text("Exta Active",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text("very intense exercise daily,or physical job",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                      )),
                  value: "extra active",
                  groupValue: activety,
                  onChanged: (val) {
                    setState(() {
                      activety = val!;
                    });
                  }),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text("Select Your Goal :-",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Row(
                children: [
                  Text("Maintane your weight",
                      style: TextStyle(fontSize: 20.0, color: Colors.green)),
                  Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: "Maintain",
                      groupValue: goal,
                      onChanged: (val) {
                        setState(() {
                          goal = val!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text("Bulking (increase your weight)",
                      style: TextStyle(fontSize: 20.0, color: Colors.green)),
                  Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: "Bulking",
                      groupValue: goal,
                      onChanged: (val) {
                        setState(() {
                          goal = val!;
                        });
                      })
                ],
              ),
              Row(
                children: [
                  Text("cutting (loss weight)",
                      style: TextStyle(fontSize: 20.0, color: Colors.green)),
                  Radio<String>(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: "cutting",
                      groupValue: goal,
                      onChanged: (val) {
                        setState(() {
                          goal = val!;
                        });
                      })
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                alignment: Alignment.topLeft,
                child: Text("insert your body data :-",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              TextFormField(
                  autofocus: false,
                  scrollPadding: EdgeInsets.all(20),
                  onSaved: (text) {
                    hight = text!;
                  },
                  validator: (text) {
                    if (text!.contains(RegExp(r'[A-Z]'))) {
                      return msg1;
                    }
                    if (text.contains(RegExp(r'[a-z]'))) {
                      return "the input should be number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffix: Text("CM"),
                      labelText: "hight",
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20.0),
                      border: OutlineInputBorder())),
              TextFormField(
                  autofocus: false,
                  onSaved: (text) {
                    weight = text!;
                  },
                  validator: (text) {
                    if (text!.contains(RegExp(r'[A-Z]'))) {
                      return "the input should be number";
                    }
                    if (text.contains(RegExp(r'[a-z]'))) {
                      return "the input should be number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffix: Text("KG"),
                      labelText: "body weight",
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20.0),
                      border: OutlineInputBorder())),
              TextFormField(
                  autofocus: false,
                  onSaved: (text) {
                    age = text!;
                  },
                  validator: (text) {
                    if (text!.contains(RegExp(r'[A-Z]'))) {
                      return "the age should be number";
                    }
                    if (text.contains(RegExp(r'[a-z]'))) {
                      return "the age should be number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      suffix: Text("Y"),
                      labelText: "AGE",
                      labelStyle: TextStyle(color: Colors.red, fontSize: 20.0),
                      border: OutlineInputBorder())),
              ElevatedButton(
                  onPressed: () async {
                    var formdata = formstate.currentState;
                    if (formdata!.validate()) {
                      formdata.save();
                      calcuate();
                      //print(check);
                      var w = Uri.parse(
                          "$ip/add_info/$hight/$weight/$age/$gender/$activety/$goal/$bmr");
                      http.get(w);
                      var z = Uri.parse("$ip/cal_counsume/$C/$C_taken");
                      http.post(z);
                      print("hiss");
                    } else
                      print("not valid");
                  },
                  child: Text("confirm data")),
              // ElevatedButton(
              //     onPressed: calcuate, child: Text("calcuate calories")),
            ],
          ),
        ),
      ));
}
