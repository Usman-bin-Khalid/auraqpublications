import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:auraq_bulk_calculator/presentation/views/live_chat/chat_room.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottom_navigation_bar/bottom_navigation_bar.dart';

class LiveChat extends StatelessWidget{
  final List<Map<String, String>> chatList = [
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
    {
      'title' : 'Usman Khalid',
      'subtitle' : 'Last message shows here',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home Page', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,
        color: Colors.black,
        ),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
              NavigationScreen()));
        },
            iconSize: 26,
            icon: Icon(Icons.arrow_back,
        color: Colors.black,)),
      ),
      body: _getBody(context),
    );
  }
  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, i) {
            return ListTile(
              leading: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ChatRoom()));
                  },
                  child: Image.asset('assets/images/dplivechat.png', width: 50, height: 50,)),
              title: Text(chatList[i]['title'].toString(), style: TextStyle(color: Colors.black,
              fontSize: 16),),
              subtitle: Text(chatList[i]['subtitle'].toString(), style: TextStyle(
                color: Colors.grey,
                fontSize: 14
              ),),
               trailing:  Container(
                 padding: EdgeInsets.all(6),
                 decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                 child: Text('3', style: TextStyle(color: Colors.white),),
               ),
            );
          }),
        ),
      ],
    );
  }

}