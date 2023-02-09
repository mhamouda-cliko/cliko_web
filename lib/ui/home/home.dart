import 'dart:io';

import 'package:flutter/material.dart';

import '../dashboard/dashboard.dart';

class HomeScreen extends StatelessWidget {
  static const String tag = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 56, 89, 1.0),
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .05),
                    child: Text(
                      "Log in ",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Divider(
                    thickness: 3,
                    color: Colors.white,
                    indent: MediaQuery.of(context).size.width * .08,
                    endIndent: MediaQuery.of(context).size.width * .45,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .10),
                    child: Text(
                      "Welcome back! Please enter your details",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.white,
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18))),
              child: Container(
                width: MediaQuery.of(context).size.width * .40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .20,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "assets/images/logo.png",
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .07),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            "Username",
                            style: TextStyle(fontSize: 14),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .07),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          label: Text(
                            "Password",
                            style: TextStyle(fontSize: 14),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(17),
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                              Text("Remember me"),
                            ],
                          ),
                          Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(17, 78, 148, 1.0)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .07),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, DashBoardScreen.tag);
                        },
                        child: Text("Log in"),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            backgroundColor: Color.fromRGBO(37, 56, 89, 1.0)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
