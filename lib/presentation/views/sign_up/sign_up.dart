import 'package:auraq_bulk_calculator/presentation/views/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/auth_services.dart';
import '../intro_screen/revision_search.dart';
import '../log_in/log_in.dart';


class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController phoneControler = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        extendBodyBehindAppBar: true,

        body: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imgbg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 10, top: 40 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      OnboardingScreen()));
                    }, icon: Icon(Icons.arrow_back, color: Colors.black, size: 27,)),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              // Image.asset(
              //   'assets/images/signup.png',
              //   width: 100,
              //   height: 100,
              // ),
              Center(child: Image.asset('assets/images/logo_two-removebg-preview.png', width: 150, height: 150,)),
              SizedBox(height: 30,),
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
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                          )),
                      // suffixIcon: Container(
                      //     width: 24,
                      //     height: 24,
                      //     child: Icon(
                      //       Icons.cancel,
                      //       color: Colors.grey,
                      //     )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
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
                    controller: phoneControler,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      hintText: 'Phone no',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.phone_android,
                            color: Colors.grey,
                          )),
                      // suffixIcon: Container(
                      //     width: 24,
                      //     height: 24,
                      //     child: Icon(
                      //       Icons.cancel,
                      //       color: Colors.grey,
                      //     )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
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
                    keyboardType: TextInputType.emailAddress,
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
                      // suffixIcon: Container(
                      //     width: 24,
                      //     height: 24,
                      //     child: Icon(
                      //       Icons.cancel,
                      //       color: Colors.grey,
                      //     )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
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
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
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
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      prefixIcon: Container(
                          width: 24,
                          height: 24,
                          child: Icon(
                            Icons.lock,
                            color: Colors.grey,
                          )),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,),
                child: Row(

                  children: [
                    ...List.generate(2, (index) => Expanded(child: Container(
                        height: 52,

                      margin: EdgeInsets.symmetric(horizontal: 5),

                      child: index == 0 ? ElevatedButton(
                        onPressed: () async {
                          if (nameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Name can not be empty!')));
                            return;
                          }
                          if (phoneControler.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Phone no can not be empty!')));
                            return;
                          }
                          if (emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Email can not be empty!')));
                            return;
                          }
                          if (passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Password can not be empty!')));
                            return;
                          }
                          if (passwordController.text.length < 6) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Password must be at least six characters!')));
                            return;
                          }
                          if (confirmPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Confirm password can not be empty!')));
                            return;
                          }
                          try {
                            isLoading = true;
                            setState(() {});
                            await AuthServices()
                                .signupUser(
                                email: emailController.text,
                                password: passwordController.text)
                                .then((value) {
                                  isLoading = false;
                                  setState(() {});
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text('Registered Successfully', style: TextStyle(fontSize: 13,
                                      fontWeight: FontWeight.w600, color: Colors.black),),

                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Login()));
                                            },
                                            child: Text('LogIn', style: TextStyle(fontSize: 15,
                                            fontWeight: FontWeight.w600, color: Colors.black),)),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_box_rounded, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 14,
                            fontWeight: FontWeight.w600),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                                side: BorderSide(width: 0.5, color: Colors.white))),
                      ) : ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        Login()));
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.lock_open, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text('Log In', style: TextStyle(color: Colors.white, fontSize: 14,
                            fontWeight: FontWeight.w600),),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                                side: BorderSide(width: 0.5, color: Colors.white))),

                      ),
                    ),
                    ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account already? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

                      if (isFirstTime) {
                        // Mark that the app has been opened before
                        await prefs.setBool('isFirstTime', false);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavigationScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'LogIn',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff209CEE),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
