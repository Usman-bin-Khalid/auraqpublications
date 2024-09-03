import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../model/model_class.dart';
import '../onboarding_screen/onboarding_elements.dart';
import '../sign_up/sign_up.dart';
import '../signingoogle.dart';
import '../video_player/videorevision.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  int _currentIndex = 0;
  Timer? _autoScrollTimer;
  bool _isScrollingPaused = false;
  bool _isScrollingForward = true;
  List<ModelClass> onBoardingData = [
    ModelClass(
        image: 'assets/images/onboardingtwo.png',
        name:
            'Writing is Hard So Publishing Should be Easy, here we believe at Auraq.'),
    ModelClass(
        image: 'assets/images/imgonboarding.png',
        name:
            'Publishing Platform trusted by Local and International Authors.'),
    ModelClass(
        image: 'assets/images/img3.png',
        name:
            'The Only real Legacy that one can Leave Behind, is a Book - Do You want to Leave Yours?'),
    ModelClass(
        image: 'assets/images/imgonb.png',
        name: 'Reviving the Authorhood Culture in Pakistan.'),
    ModelClass(
        image: 'assets/images/edcn.png',
        name: 'Self Publishing and Print On Demand (POD) made Easy.'),
    ModelClass(
        image: 'assets/images/lightingbooks.png',
        name:
            'A publishing house is where stories are born and given wings to fly.'),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentIndex = pageController.page?.round() ?? 0;
      });
    });
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!_isScrollingPaused) {
        int nextPage;
        if (_isScrollingForward) {
          nextPage = _currentIndex + 1;
          if (nextPage >= onBoardingData.length) {
            // Reverse direction and move to the last page
            nextPage = onBoardingData.length - 1;
            _isScrollingForward = false;
          }
        } else {
          nextPage = _currentIndex - 1;
          if (nextPage < 0) {
            // Reverse direction and move to the first page
            nextPage = 0;
            _isScrollingForward = true;
          }
        }
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _pauseAutoScroll() {
    setState(() {
      _isScrollingPaused = true;
    });
    _autoScrollTimer?.cancel();
  }

  void _resumeAutoScroll() {
    setState(() {
      _isScrollingPaused = false;
    });
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              elevation: 0,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff27272E),
                      ),
                      textAlign: TextAlign.right,
                    ))
              ],
            )
          : AppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff27272E),
                      ),
                      textAlign: TextAlign.right,
                    ))
              ],
              leading: Padding(
                padding: EdgeInsets.only(left: 20),
                child: IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
      body: GestureDetector(
        onTap: () {
          if (_isScrollingPaused) {
            _resumeAutoScroll();
          } else {
            _pauseAutoScroll();
          }
        },
        child: _getBody(context),
      ),
    );
  }

  Widget _getBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
              itemCount: onBoardingData.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return ModelElements(modelClass: onBoardingData[index]);
              }),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: onBoardingData.length,
          effect: ExpandingDotsEffect(
              dotHeight: 6, dotWidth: 6, dotColor: Color(0xff209CEE)),
          onDotClicked: (index) {},
        ),
        _buildBottomButtons(),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentIndex == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    } else {
                      pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _currentIndex == onBoardingData.length - 1
                            ? 'FINISH'
                            : 'NEXT',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF)),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        _currentIndex == onBoardingData.length - 1
                            ? Icons.arrow_forward
                            : Icons.arrow_forward,
                        size: 24,
                        color: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Color(0xff27272E)),
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageDashboard()));
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/gi.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaperDropDown()));
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/fi.png',
                          width: 42,
                          height: 42,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/emailimg.png',
                          width: 39,
                          height: 39,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.black, width: 0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )
        // Your other buttons here
      ],
    );
  }
}
