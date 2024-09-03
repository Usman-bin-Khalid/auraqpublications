import 'package:auraq_bulk_calculator/presentation/views/book_store/discounted_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../book_store/dashboard_screen.dart';
import '../chat_gpt/ai_chat_board.dart';
import '../dashboard/dashboard.dart';
import '../faqs/faqs.dart';
import '../intro_screen/intro_screen.dart';
import '../video_player/video_player_widget.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  List<Widget> screenList = [
    IntroScreen(),
    BookStoreDashboard(),
    VideoPlayerWidget(),
    ChatScreen(),
    FAQScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      // The elementAt method is used to access an element at a specific index in the list.
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (val) {
          selectedIndex = val;
          setState(() {});
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bn1.png',
                width: 20,
                height: 20,
                color: selectedIndex == 0 ? Colors.blue : Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bn2.png',
                width: 20,
                height: 20,
                color: selectedIndex == 1 ? Colors.blue : Colors.black,
              ),
              label: 'Trending'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bn3.png',
                width: 20,
                height: 20,
                color: selectedIndex == 2 ? Colors.blue : Colors.black,
              ),
              label: 'Video'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bn4.png',
                width: 20,
                height: 20,
                color: selectedIndex == 3 ? Colors.blue : Colors.black,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/bn5.png',
                width: 20,
                height: 20,
                color: selectedIndex == 4 ? Colors.blue : Colors.black,
              ),
              label: 'More'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontSize: 10, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontSize: 10, color: Colors.black),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

