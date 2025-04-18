import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class Loginst extends StatefulWidget {
  const Loginst({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginstState();
  }
}

class LoginstState extends State<Loginst> {
  var email = "";
  var password = "";
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  bool icn1 = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  Text x = Text(
    "login",
    style: TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16.sp,
    ),
  );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        //  color: Color(color2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: SizedBox(
                  height: 300.h,
                  width: width,
                  //   color: darkblue,
                  child: Image.asset(
                    "assets/icons/Studying-cuate (1).png",
                    height: 280.h,
                    width: 600.w,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Welcome to It's School !",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SizedBox(
                  height: 130.h,
                  width: 400.w,
                  child: Form(
                    key: formstate,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            onSaved: (text) {
                              email = text!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              return (text != null && text.contains('@'))
                                  ? null
                                  : "you dont use the @ char";
                            },
                            cursorColor:
                                const Color.fromARGB(255, 141, 168, 209),
                            cursorHeight: 20,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(
                                color: darkblue,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Text(
                                  "Username",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: darkblue,
                                  ),
                                ),
                              ),

                              hintText: "Enter your username",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 141, 168, 209),
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                              ),
                              // filled: true,
                              //  fillColor: lightblue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: lightblue,
                                ),
                                // borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(
                                Icons.person,
                                color: darkblue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            onSaved: (text) {
                              password = text!;
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: icn1,
                            cursorColor:
                                const Color.fromARGB(255, 141, 168, 209),
                            cursorHeight: 20,
                            validator: (text) {
                              if (text!.length < 8) {
                                return "you have to enter 8 char";
                              } else {
                                return null;
                              }
                            },
                            //  maxLength: 8,
                            decoration: InputDecoration(
                              counterStyle: TextStyle(
                                color: darkblue,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              label: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: darkblue,
                                  ),
                                ),
                              ),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 141, 168, 209),
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                              ),
                              //   filled: true,
                              //    fillColor: lightblue,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: darkblue,
                                  )
                                  //   borderSide: BorderSide.none,
                                  ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  icn1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: darkblue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    icn1 = !icn1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 200 ),
              //   child: Text(
              //     "Forget my password",
              //     style: TextStyle(
              //         fontFamily: 'Montserrat',
              //         color: const Color.fromARGB(255, 141, 168, 209),
              //         fontSize: 12.sp),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 35.h,
                  width: 300.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        elevation: WidgetStateProperty.all(10),
                        shadowColor: WidgetStateProperty.all(Colors.black),
                        backgroundColor: WidgetStateProperty.all(
                          darkblue,
                        ),
                        foregroundColor: WidgetStateProperty.all(
                          lightblue,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          // loginData();
                          Get.offNamed('/b');
                        });
                      },
                      child: x),
                ),
              ),
              SizedBox(
                height: height * 0.08,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 141, 168, 209),
                          fontSize: 17,
                        ),
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            darkblue,
                          ),
                        ),
                        child: const Text(
                          "website",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          log("hhfjh");
                          //  Navigator.of(context).pushNamed('sign up');
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
