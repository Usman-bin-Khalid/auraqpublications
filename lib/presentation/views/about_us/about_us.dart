// import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class AboutUsPage extends StatelessWidget {
//   final String url = "https://auraqpublications.com/";
//
//   void _launchURL() async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),),
//         centerTitle: true,
//         leading: IconButton(
//           iconSize: 25,
//             onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()));
//         }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'assets/images/logo_two-removebg-preview.png', // Replace with your logo asset
//                   height: 100,
//                   width: 100,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Welcome to Auraq Publications',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'At Auraq Publications, we are passionate about books and '
//                     'committed to providing the best selection of titles for our readers. '
//                     'Whether you\'re looking for the latest bestseller, a timeless classic, '
//                     'or something unique, we have something for everyone.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Our Mission',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Our mission is to foster a love for reading by offering a diverse '
//                     'range of books, excellent customer service, and a welcoming environment '
//                     'for all book lovers.',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Contact Us',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Email: raabta@auraqpublication.com\n'
//                     'Phone: +92 300 0571530\n'
//                     'Address: BS-06, Satti Plaza, Stadium Road, Rawalpindi, Punjab, Pakistan',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//         // Center(
//         //   child: ElevatedButton(
//         //     onPressed: _launchURL,
//         //     child: Text('Visit Our Website'),
//         //   ),
//         // ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 40),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _launchURL,
//                     child: Ink(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(colors: [
//                           Color(0xff6a11cb),
//                           Color(0xff2575fc),
//                         ], begin: Alignment.topLeft, end: Alignment.centerRight),
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.white, width: 1),
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.email,
//                               color: Colors.white,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               'Visit Our Website',
//                               style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       maximumSize: Size(double.infinity, 48),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 0,
//                     ),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../intro_screen/intro_screen.dart';

class AboutUsPage extends StatelessWidget {
  final String url = "https://auraqpublications.com/";

  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'About Us',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
            iconSize: 26,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.teal,
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal.shade100, Colors.teal.shade50],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/images/logo_two-removebg-preview.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Auraq Publications',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Auraq Publications',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'At Auraq Publications, we are passionate about books and '
                  'committed to providing the best selection of titles for our readers. '
                  'Whether you\'re looking for the latest bestseller, a timeless classic, '
                  'or something unique, we have something for everyone.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Divider(color: Colors.teal.shade400),
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Our mission is to foster a love for reading by offering a diverse '
                  'range of books, excellent customer service, and a welcoming environment '
                  'for all book lovers.',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Divider(color: Colors.teal.shade400),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.account_box_rounded, color: Colors.teal.shade700),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'CEO: Muhammad Usama',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.teal.shade700),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Email: raabta@auraqpublications.com',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.phone_android, color: Colors.teal.shade700),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Mobile: +92 300 0571530',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Colors.teal.shade700),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Address: BS-06, Satti Plaza, Stadium Road, Rawalpindi, Punjab, Pakistan',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _launchURL,
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.teal.shade600,
                                Colors.teal.shade600,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white, width: 1),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.public,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Visit Our Website',
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
