import 'dart:developer';

import 'package:auraq_bulk_calculator/presentation/views/api_services/auth_services_apis.dart';
import 'package:auraq_bulk_calculator/presentation/views/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../services/auth_services.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';


class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(

          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationScreen()));
          }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Log In',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/imgbg.png'), fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/images/logo_two-removebg-preview.png', width: 150, height: 150,)),
                SizedBox(
                  height: 24,
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
                      controller: emailController,

                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 15),
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
                              Icons.email,
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
                  height: 14,
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
                      controller: pwdController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(

                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        prefixIcon: Container(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.password,
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
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          isLoading = true;
                          setState(() {});
                          await AuthServicesApis()
                              .loginUser(
                              email: emailController.text,
                              password: pwdController.text)
                              .then((val) async {
                            isLoading = false;
                            setState(() {});
                            val.fold((left) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(left.message.toString())));
                            }, (right) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(right.message.toString())));
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
                          gradient: LinearGradient(colors: [
                            Color(0xff6a11cb),
                            Color(0xff2575fc),
                          ], begin: Alignment.topLeft, end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.lock_open,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Log In',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        maximumSize: Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}