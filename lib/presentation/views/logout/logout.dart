import 'package:auraq_bulk_calculator/presentation/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:loading_overlay/loading_overlay.dart';

import '../../../services/auth_services.dart';
import '../intro_screen/revision_search.dart';
import '../log_in/log_in.dart';

class Logout extends StatefulWidget {
  @override
  State<Logout> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<Logout> {
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'LogOut',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            NavigationScreen()));
          },
              iconSize: 26,
              icon: Icon(Icons.arrow_back,
          color: Colors.black,
          )),
          centerTitle: true,
        ),
        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/imgbg.png'), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextField(controller: passwordController,),
          Center(
            child: Image.asset(
              'assets/images/logout-removebg-preview (1).png',
              width: 70,
              height: 70,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(
              'Give your email address you used during registration',
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff6B6E74)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Container(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.email_rounded,
                        color: Colors.grey,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email can not be empty')));
                    return;
                  }
                  try {
                    isLoading = true;
                    setState(() {});
                    AuthServices().logOut().then((value){
                      isLoading = false;
                      setState(() {});
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Container(
                              child: AlertDialog(
                                title: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset("assets/images/logo_two-removebg-preview.png",
                                      width: 70,
                                      height: 70,),
                                      SizedBox(height: 8,),
                                      Text(
                                        'Are you sure you want to LogOut from all devices?',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.w500,
                                            color: Color(0xff1E1A15)),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        top: 38),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                  NavigationScreen()));
                                            },
                                            child: Text(
                                              'Cancel',

                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  color: Color(
                                                      0xff979797)),
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                  context);
                                              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                  OnboardingScreen()));
                                            },
                                            child: Text(
                                              'LogOut',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                  FontWeight
                                                      .w600,
                                                  color: Color(
                                                      0xffEA4235)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    });



                  } catch (e) {
                    isLoading = false;
                    setState(() {});
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff6a11cb),
                          Color(0xff2575fc),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.centerRight,
                      ),
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ))),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  maximumSize: Size(double.infinity, 44),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
