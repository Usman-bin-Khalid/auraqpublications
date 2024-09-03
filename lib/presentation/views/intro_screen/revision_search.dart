import 'dart:async';

import 'package:auraq_bulk_calculator/model/model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RevisionSearch extends StatefulWidget{
  @override
  State<RevisionSearch> createState() => _RevisionSearchState();
}

class _RevisionSearchState extends State<RevisionSearch> {
  final List<ModelClass> onBoardingData = [
     ModelClass(image: "", name: ""),
     ModelClass(image: "", name: ""),
     ModelClass(image: "", name: ""),
     ModelClass(image: "", name: ""),
  ];
   int currentIndex = 0;
   PageController _pageController = PageController();
   bool isScrollingPaused = false;
   bool isScrollingForward = true;
    Timer? autoScrollTimer;


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      currentIndex = _pageController.page?.round() ?? 0;
    });
    startAutoScroll();
  }
  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if(!isScrollingPaused) {
        int nextPage;
        if(isScrollingForward){
          nextPage = currentIndex + 1;
          if(nextPage >= onBoardingData.length) {
            nextPage = onBoardingData.length - 1;
            isScrollingForward = false;
          }
        }else {
          nextPage = currentIndex -1;
          if(nextPage >0){
            nextPage = 0;
            isScrollingForward = true;
          }
        }
      }
    });
  }

    void pauseAutoScroll() {
      isScrollingPaused = true;
      setState(() {});
      autoScrollTimer?.cancel();
    }

    void resumeAutoScroll() {
      isScrollingPaused = false;
      setState(() {});
      startAutoScroll();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: currentIndex == 0 ? AppBar(
         actions: [
           TextButton(onPressed: (){}, child: Text("SKIP")),
         ],
       ) : AppBar(leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       actions: [
         TextButton(onPressed: (){}, child: Text('SKIP')),
       ],
       ),

      body: _getBody(context),
    );
  }
  Widget _getBody(BuildContext context) {
    return ListView.builder(
        itemCount: onBoardingData.length,
        itemBuilder: (context, index) {
       return Column(
         children: [

         ],
       );
    });
  }
}

