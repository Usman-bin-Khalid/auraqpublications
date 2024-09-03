import 'package:auraq_bulk_calculator/model/bulk_model.dart';
import 'package:auraq_bulk_calculator/presentation/views/api_services/login_user_api.dart';
import 'package:auraq_bulk_calculator/presentation/views/book_store/books_store.dart';
import 'package:auraq_bulk_calculator/presentation/views/book_store/dashboard_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/book_store/published_books.dart';
import 'package:auraq_bulk_calculator/presentation/views/chat_gpt/ai_chat_board.dart';
import 'package:auraq_bulk_calculator/presentation/views/dashboard/dashboard.dart';
import 'package:auraq_bulk_calculator/presentation/views/faqs/faqs.dart';
import 'package:auraq_bulk_calculator/presentation/views/input_screen/input_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/live_chat/live_chat.dart';
import 'package:auraq_bulk_calculator/presentation/views/log_in/log_in.dart';
import 'package:auraq_bulk_calculator/presentation/views/offered_services/offered_services.dart';
import 'package:auraq_bulk_calculator/presentation/views/onboarding_screen/onboarding_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/sign_up/sign_up.dart';
import 'package:auraq_bulk_calculator/presentation/views/video_player/video_player_multiple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../about_us/about_us.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../logout/logout.dart';
import '../video_player/video_player_widget.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int selectedIndex = -1;

  List navdraw = [
    {
      'image': 'assets/images/bn1.png',
      'title': 'Home',
      'subtitle': 'My Home',
    },
    {
      'image': 'assets/images/bn2.png',
      'title': 'Trending',
      'subtitle': "Today's trends "
    },
    {
      'image': 'assets/images/bn3.png',
      'title': 'Video',
      'subtitle': 'See videos here'
    },
    {
      'image': 'assets/images/bn4.png',
      'title': 'Search',
      'subtitle': 'Search from here'
    },
    {
      'image': 'assets/images/bn5.png',
      'title': 'More',
      'subtitle': 'Something more'
    },
    {
      'image': 'assets/images/bn6.png',
      'title': 'Share',
      'subtitle': 'Share this app'
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),

                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,

                          ),
                          child: Image.asset(
                            'assets/images/logo_two-removebg-preview.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 2),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Auraq Publications',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'raabta@auraqpublications.com',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView.builder(
                    itemCount: navdraw.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = i;
                          setState(() {});
                          if (i == 0) {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                NavigationScreen()));
                          } else if (i == 1) {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                BookStoreDashboard()));
                          } else if (i == 2) {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                VideoPlayerWidget()));
                          } else if (i == 3) {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => ChatBoard()));
                          } else if (i == 4) {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                FAQScreen()));
                          } else {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                ChatBoard()));
                          }
                        },
                        child: ListTile(
                          leading: Image.asset(
                            navdraw[i]['image'],
                            width: 20,
                            height: 20,
                            color:
                            selectedIndex == i ? Colors.blue : Colors.black,
                          ),
                          title: Text(
                            navdraw[i]['title'],
                            style: TextStyle(
                                color: selectedIndex == i
                                    ? Colors.blue
                                    : Colors.black),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              navdraw[i]['subtitle'],
                              style: TextStyle(
                                  color: selectedIndex == i
                                      ? Colors.blue
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text('DASHBOARD SCREEN',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12, top : 4),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 0.5, color: Colors.black),
              ),
              child: Image.asset("assets/images/auraqlogo.png", width: 22, height: 22,

              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,),
            ),
          ),
        ],
      ),
      body: _getBody(context),

    );
  }

  Widget _getBody(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(image:
      //   AssetImage('assets/images/imgbg.png'),
      //     fit: BoxFit.cover
      //   )
      // ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Center(
            //   child: Text("AURAQ PUBLICATIONS", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,
            //   color: Colors.black),),
            // ),
            Center(child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0,3,),
                    ),
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(width: 0.5, color: Colors.black),

                ),
                child: Image.asset(
                  'assets/images/logo_two-removebg-preview.png', width: 100,
                  height: 100,))),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, bottom: 7, top: 7),
              child: Column(
                children: [
                  Text('Who We Are ?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,
                        color: Colors.black),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 6,),
                  GestureDetector(
                    onLongPress: () =>
                        copyToClipboard(context,
                            'Auraq Publications is one of the Pakistan’s well-functioning publishing house. Our aim is to facilitate writers in getting their words out there. We believe that any writer can become an author as long as they have proper help and support from an established publishing organization. Auraq provides a platform which gives them the space to grow and allows them to excel in their writing career. We don’t lead the writers, rather we work as a team side by side. This spirit of Auraq has helped us to win the trust of writers not just in Pakistan but across the world.'),
                    child: Text(
                      'Auraq Publications is one of the Pakistan’s well-functioning publishing house. Our aim is to facilitate writers in getting their words out there. We believe that any writer can become an author as long as they have proper help and support from an established publishing organization.',
                      // Auraq provides a platform which gives them the space to grow and allows them to excel in their writing career. We don’t lead the writers, rather we work as a team side by side. This spirit of Auraq has helped us to win the trust of writers not just in Pakistan but across the world.
                      style: TextStyle(color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(
                        child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0,3,),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.5, color: Colors.black),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Conditional rendering of image
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Image.asset(
                                      index == 0
                                          ? 'assets/images/serviceimg.png' // Image for first container
                                          : 'assets/images/faqsimg.png',
                                      // Image for second container
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                index == 0 ?
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) =>
                                                OfferedServices(
                                                  model: BulkModel(),)));
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
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            borderRadius: BorderRadius.circular(
                                                12),
                                          ),
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  // Icon(
                                                  //   Icons.add,
                                                  //   color: Colors.white,
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 7,
                                                  // ),
                                                  Text(
                                                    'Our Services',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight
                                                            .w400),
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
                                ) :
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) =>
                                                FAQScreen()));
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
                                            border: Border.all(
                                                width: 1, color: Colors.white),
                                            borderRadius: BorderRadius.circular(
                                                12),
                                          ),
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,
                                                children: [
                                                  // Icon(
                                                  //   Icons.add,
                                                  //   color: Colors.white,
                                                  // ),
                                                  // SizedBox(
                                                  //   width: 7,
                                                  // ),
                                                  Text(
                                                    'FAQs',
                                                    style: TextStyle(

                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight: FontWeight
                                                            .w400),
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
                            )
                        ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(child: Container(

                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3,),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Conditional rendering of image
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/stackofbook-removebg-preview.png' // Image for first container
                                        : 'assets/images/addbook-removebg-preview.png',
                                    // Image for second container
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              index == 0 ?
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              BookStoreDashboard()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                // Icon(
                                                //   Icons.add,
                                                //   color: Colors.white,
                                                // ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                Text(
                                                  'Book Store',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                              ) :
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              BooksStore(model: BulkModel(),
                                                  isUpdateMode: false)));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                // Icon(
                                                //   Icons.add,
                                                //   color: Colors.white,
                                                // ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                Text(
                                                  'Add Book',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                          )
                      ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),

                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3,),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Conditional rendering of image
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/calculation2-removebg-preview.png' // Image for first container
                                        : 'assets/images/calculatecose.png',
                                    // Image for second container
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              index == 0 ?
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              Dashboard()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [

                                                Text(
                                                  'Bulk Calculator',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                              ) :
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              InputScreen(model: BulkModel(),
                                                  isUpdateMode: false)));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'Calculate Price',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                          )
                      ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(child: Container(

                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3,),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Conditional rendering of image
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/apiremovebg.png' // Image for first container
                                        : 'assets/images/roudyoutubeicon.png',
                                    // Image for second container
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              index == 0 ?
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              LoginView()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'APIs',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                              ) :
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              VideoPlayerWidget()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                // Icon(
                                                //   Icons.add,
                                                //   color: Colors.white,
                                                // ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                Text(
                                                  'Videos',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                          )
                      ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3,),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Conditional rendering of image
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/chatgptlogo.png' // Image for first container
                                        : 'assets/images/aboutusremovebg.png',
                                    // Image for second container
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              index == 0 ?
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              ChatBoard()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'AI ChatBoard',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                              ) :
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              AboutUsPage()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                // Icon(
                                                //   Icons.add,
                                                //   color: Colors.white,
                                                // ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                Text(
                                                  'About Us',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                          )
                      ),
                      ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Row(
                children: [
                  ...List.generate(2, (index) =>
                      Expanded(child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: Offset(0,3,),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5, color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Conditional rendering of image
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Image.asset(
                                    index == 0
                                        ? 'assets/images/livechaticon.png' // Image for first container
                                        : 'assets/images/logout-removebg-preview (1).png',
                                    // Image for second container
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                              ),
                              index == 0 ?
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              LiveChat()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                Text(
                                                  'Live Chat',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                              ) :
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              Logout()));
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
                                          border: Border.all(
                                              width: 1, color: Colors.white),
                                          borderRadius: BorderRadius.circular(
                                              12),
                                        ),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .center,
                                              children: [
                                                // Icon(
                                                //   Icons.add,
                                                //   color: Colors.white,
                                                // ),
                                                // SizedBox(
                                                //   width: 7,
                                                // ),
                                                Text(
                                                  'Log Out',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight
                                                          .w400),
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
                          )
                      ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Copied to clipboard')));
  }
}