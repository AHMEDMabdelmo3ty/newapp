import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Mystring.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

//final controller = Get.find<contoler>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              //  Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/forgetpass copy.png',
                    width: 250,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: emailController,
                    obscureText: false,
                    /*   validator: (value) {
                      if (!RegExp(validationEmail).hasMatch(value!)) {
                        return 'Invalid email';
                      } else {
                        return null;
                      }*/
                    //  },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 30,
                        ),
                        suffixIcon: const Text(" "),
                        hintText: 'Email'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  /*  GetBuilder(builder: (_) {
                    return ElevatedButton(
                      onPressed: () {
                        /*   if (formKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          // controller.resetPassword(email);
                        }*/
                      },
                      style: ElevatedButton.styleFrom(
                        //primary: Color(Colors.black),
                        minimumSize: const Size(360, 50),
                      ),
                      child: Text(
                        "SEND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    );
                  }*/

                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
