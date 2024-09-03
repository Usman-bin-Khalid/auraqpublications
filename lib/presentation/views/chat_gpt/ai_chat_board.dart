// import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(const ChatBoard());
// }
//
// class ChatBoard extends StatelessWidget {
//   const ChatBoard({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat GPT',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ChatScreen(),
//     );
//   }
// }
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _userInput =TextEditingController();
//
//   static const apiKey = "AIzaSyAFJK3sN3aDEbZ--tfhJ3H-iReNp7VkAy0";
//
//   final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//
//   final List<Message> _messages = [];
//
//   Future<void> sendMessage() async{
//     final message = _userInput.text;
//
//     setState(() {
//       _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
//     });
//
//     final content = [Content.text(message)];
//     final response = await model.generateContent(content);
//
//
//     setState(() {
//       _messages.add(Message(isUser: false, message: response.text?? "", date: DateTime.now()));
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("AI ChatBoard", style: TextStyle(color: Colors.white, fontSize: 20,
//       fontWeight: FontWeight.w600,
//       ),),
//       backgroundColor: Colors.blueAccent,
//       centerTitle: true,
//         leading: IconButton(
//           iconSize: 24,
//             onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context) =>
//             IntroScreen(),
//           ));
//         }, icon: Icon(Icons.arrow_back, color: Colors.white)),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//             // image: DecorationImage(
//             //     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
//             //     image: NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEigDbiBM6I5Fx1Jbz-hj_mqL_KtAPlv9UsQwpthZIfFLjL-hvCmst09I-RbQsbVt5Z0QzYI_Xj1l8vkS8JrP6eUlgK89GJzbb_P-BwLhVP13PalBm8ga1hbW5pVx8bswNWCjqZj2XxTFvwQ__u4ytDKvfFi5I2W9MDtH3wFXxww19EVYkN8IzIDJLh_aw/s1920/space-soldier-ai-wallpaper-4k.webp'),
//             //     fit: BoxFit.cover
//
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//                 child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
//                   final message = _messages[index];
//                   return Messages(isUser: message.isUser, message: message.message, date: DateFormat('HH:mm').format(message.date));
//                 })
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 15,
//                     child:
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15, bottom: 15),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: TextField(
//
//                           controller: _userInput,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding:
//                               EdgeInsets.only(left: 5,right: 4, top: 11, bottom: 8),
//                               prefixIcon: Icon(
//                                 Icons.search_rounded ,
//                                 size: 21,
//                                 color: Colors.grey,
//                               ),
//                               hintText: 'Message AI ChatBoard',
//                               hintStyle: TextStyle(color: Colors.grey)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5,),
//                   IconButton(
//                       padding: EdgeInsets.all(12),
//                       iconSize: 20,
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all(Colors.green),
//                           foregroundColor: MaterialStateProperty.all(Colors.white),
//                           shape: MaterialStateProperty.all(CircleBorder())
//                       ),
//                       onPressed: (){
//                         sendMessage();
//                       },
//                       icon: Icon(Icons.send))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Message{
//   final bool isUser;
//   final String message;
//   final DateTime date;
//
//   Message({ required this.isUser, required this.message, required this.date});
// }
//
// class Messages extends StatelessWidget {
//
//   final bool isUser;
//   final String message;
//   final String date;
//
//   const Messages(
//       {
//         super.key,
//         required this.isUser,
//         required this.message,
//         required this.date
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(15),
//       margin: EdgeInsets.symmetric(vertical: 15).copyWith(
//           left: isUser ? 100:10,
//           right: isUser ? 10: 100
//       ),
//       decoration: BoxDecoration(
//           color: isUser ? Colors.blueAccent : Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10),
//               bottomLeft: isUser ? Radius.circular(10): Radius.zero,
//               topRight: Radius.circular(10),
//               bottomRight: isUser ? Radius.zero : Radius.circular(10)
//           )
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onLongPress: (){
//               Clipboard.setData(ClipboardData(text: message));
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied to clipboard"),
//               duration: Duration(seconds: 1),
//               ));
//
//             },
//             child: SelectableText(
//               message,
//               style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
//             ),
//           ),
//           Text(
//             date,
//             style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:auraq_bulk_calculator/presentation/views/intro_screen/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

import '../bottom_navigation_bar/bottom_navigation_bar.dart';

void main() {
  runApp(const ChatBoard());
}

class ChatBoard extends StatelessWidget {
  const ChatBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat GPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _userInput = TextEditingController();

  static const apiKey = "AIzaSyAFJK3sN3aDEbZ--tfhJ3H-iReNp7VkAy0";

  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

  final List<Message> _messages = [];
  bool _isLoading = false;

  Future<void> sendMessage() async {
    final message = _userInput.text;

    setState(() {
      _messages.add(Message(isUser: true, message: message, date: DateTime.now()));
      _isLoading = true; // Start loading animation
    });

    final content = [Content.text(message)];
    final response = await model.generateContent(content);

    setState(() {
      _messages.add(Message(isUser: false, message: response.text ?? "", date: DateTime.now()));
      _isLoading = false; // Stop loading animation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "AI ChatBoard",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          iconSize: 26,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NavigationScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == _messages.length) {
                    return LoadingIndicator(); // Show loading animation
                  }
                  final message = _messages[index];
                  return Messages(
                    isUser: message.isUser,
                    message: message.message,
                    date: DateFormat('HH:mm').format(message.date),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: _userInput,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                            prefixIcon: Image.asset("assets/images/metaicon.png", width: 20, height: 20,),
                            hintText: 'Message AI ChatBoard',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    padding: EdgeInsets.all(13),
                    iconSize: 20,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(CircleBorder()),
                    ),
                    onPressed: () {
                      sendMessage();
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({required this.isUser, required this.message, required this.date});
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;

  const Messages({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
          color: isUser ? Colors.green : Colors.white,
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: isUser ? Radius.circular(10) : Radius.zero,
          topRight: Radius.circular(10),
          bottomRight: isUser ? Radius.zero : Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: message));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Copied to clipboard"),
                  duration: Duration(seconds: 1),
                ),
              );
            },

            child: SelectableText(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10,
              color: isUser ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

class LoadingIndicator extends StatefulWidget {
  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAnimatedDot(Colors.black, 0),
              SizedBox(width: 0.5),
              _buildAnimatedDot(Colors.grey, 1),
              SizedBox(width: 0.5),
              _buildAnimatedDot(Colors.black, 2),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAnimatedDot(Color color, int index) {
    return Transform.translate(
      offset: Offset(0, -10 * (_animation.value - 0.5).abs() * 2), // Moves dots up and down
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: Color.lerp(color, Colors.white, _animation.value), // Changes color
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
