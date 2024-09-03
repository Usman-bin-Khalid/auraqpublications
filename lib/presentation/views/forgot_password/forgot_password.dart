import 'package:auraq_bulk_calculator/presentation/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:loading_overlay/loading_overlay.dart';

import '../../../services/auth_services.dart';
import '../log_in/log_in.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
            'Forgot Password',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
            NavigationScreen()));
          }, icon: Icon(Icons.arrow_back, size: 26, color: Colors.black,)),
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
              'assets/images/img_fp.png',
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
                    await AuthServices()
                        .forgotPassword(passwordController.text)
                        .then((value) {
                      isLoading = false;
                      setState(() {});
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/images/logo_two-removebg-preview.png",
                                    width: 70,
                                    height: 70,),
                                  SizedBox(height: 8,),
                                  Text('An email with password reset link has been sent to this Email',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black),
                                    textAlign: TextAlign.center,),
                                  Text('${passwordController.text.toString()}', style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400, color: Color(0xff622CEA),
                                  ),
                                    textAlign: TextAlign.center,),
                                  Text('Kindly tap to reset your password', style: TextStyle(fontWeight: FontWeight.w300,
                                      fontSize: 15, color: Colors.black),
                                    textAlign: TextAlign.center,),
                                ],
                              ),

                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ))
                              ],
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
                              Icons.email_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              'RECOVER',
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
