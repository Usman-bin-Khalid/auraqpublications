import 'package:auraq_bulk_calculator/presentation/views/onboarding_screen/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'bottom_navigation_bar/bottom_navigation_bar.dart';
import 'intro_screen/revision_search.dart';

class HomePageDashboard extends StatefulWidget {
  @override
  State<HomePageDashboard> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
      if (_user != null) {
        // Navigate to the Navigation Screen if user is not null
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Google Sign In',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 27,
            )),
        centerTitle: true,
      ),
      body: _user != null ? _userInfo() : googleSignIn(),
    );
  }

  Widget googleSignIn() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(
          elevation: 0,
          Buttons.google,
          onPressed: () {
            handleGoogleSignIn();
          },
          text: "SignIn with Google",
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _userInfo() {
    return SizedBox();
  }

  void handleGoogleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
