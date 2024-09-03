import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/model_class.dart';

class VideoPlayerMultiple extends StatefulWidget {
  @override
  State<VideoPlayerMultiple> createState() => _VideoPlayerMultipleState();
}

class _VideoPlayerMultipleState extends State<VideoPlayerMultiple> {
  List<ModelClass> modelClass = [
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
        if(isScrollingForward) {
          nextPage = currentIndex + 1;
          if(nextPage <= modelClass.length) {
            nextPage = modelClass.length -1;
            isScrollingForward = false;
          }
        }else {
          nextPage = currentIndex -1;
          if(nextPage <0){
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
      appBar: AppBar(
        title: Text("Onboarding App"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: (){
          if(isScrollingPaused){
            resumeAutoScroll();
          }else {
            pauseAutoScroll();
          }
        },
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
