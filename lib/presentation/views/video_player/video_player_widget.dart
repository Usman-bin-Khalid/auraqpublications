import 'package:auraq_bulk_calculator/presentation/views/log_in/log_in.dart';
import 'package:auraq_bulk_calculator/presentation/views/sign_up/sign_up.dart';
import 'package:auraq_bulk_calculator/presentation/views/video_player/video_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../model/model_class.dart';
import '../bottom_navigation_bar/bottom_navigation_bar.dart';
import '../intro_screen/intro_screen.dart';

// Step 1: Create a Data Model
class MediaItem {
  final String videoUrl;
  final String imageUrl;
  final String title;
  final String subtitle;

  MediaItem({
    required this.videoUrl,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class VideoPlayerWidget extends StatefulWidget {
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  final List<MediaItem> mediaItems = [
    MediaItem(
      videoUrl: "https://www.youtube.com/watch?v=SmnKQ0YObgk",
      imageUrl: "assets/images/logo_two-removebg-preview.png",
      title:
          "Born during the conflict of 1971, Raees Ali’s life became entwined.",
      subtitle: "4 hours ago | Auraq Publications",
    ),
    MediaItem(
      videoUrl: "https://www.youtube.com/watch?v=6Py3j3OyRPM&t=5s",
      imageUrl: "assets/images/youtubelogoicon.png",
      title: "What Happens To You When You Read a Book Every Day.",
      subtitle: "5 hours ago | Bestie Health",
    ),
    MediaItem(
      videoUrl: "https://www.youtube.com/watch?v=sGmxH3-ADQU&t=61s",
      imageUrl: "assets/images/kslogo.png",
      title:
          "Importance Of Book Reading - Benefits Of Reading  Famous Quotes  Kitaab Suno.",
      subtitle: "6 hours ago | Kitab Suno",
    ),
    MediaItem(
      videoUrl: "https://www.youtube.com/watch?v=9y7ToRjnSuQ&t=1s",
      imageUrl: "assets/images/geologo.png",
      title: "Five books that Pakistani youth must read..!!  Qasim Ali Shah.",
      subtitle: "7 hours ago | Geo News",
    ),
    MediaItem(
      videoUrl: "https://www.youtube.com/watch?v=ZMP0Ulo-SKQ",
      imageUrl: "assets/images/logo.jpg",
      title: "7 Reasons Why Reading A Book A Week Will Change Your Life.",
      subtitle: "8 hours ago | MotivationStudy",
    ), // Add more items as needed
  ];
  List<ModelClass> videoList = [
    ModelClass(
        name: 'Auraq News',
        image: 'assets/images/logo_two-removebg-preview.png'),
    ModelClass(name: 'Youtube', image: 'assets/images/youtubelogoicon.png'),
    ModelClass(name: 'Kitab Suno', image: 'assets/images/kslogo.png'),
    ModelClass(name: 'Geo News', image: 'assets/images/geologo.png'),
    ModelClass(name: 'ARY', image: 'assets/images/logo.jpg'),
    ModelClass(
        name: 'Auraq News',
        image: 'assets/images/logo_two-removebg-preview.png'),
    ModelClass(name: 'Youtube', image: 'assets/images/youtubelogoicon.png'),
    ModelClass(name: 'Kitab Suno', image: 'assets/images/kslogo.png'),
    ModelClass(name: 'Geo News', image: 'assets/images/geologo.png'),
    ModelClass(name: 'ARY', image: 'assets/images/logo.jpg'),
    ModelClass(
        name: 'Auraq News',
        image: 'assets/images/logo_two-removebg-preview.png'),
    ModelClass(name: 'Youtube', image: 'assets/images/youtubelogoicon.png'),
    ModelClass(name: 'Kitab Suno', image: 'assets/images/kslogo.png'),
    ModelClass(name: 'Geo News', image: 'assets/images/geologo.png'),
    ModelClass(name: 'ARY', image: 'assets/images/logo.jpg'),
  ];

  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = mediaItems.map<YoutubePlayerController>((videos) {
      final videoID = YoutubePlayer.convertUrlToId(videos.videoUrl);

      if (videoID == null) {
        throw Exception("Invalid video URL: ${videos.videoUrl}");
      }
      return YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "VIDEOS",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff1E1A15),
              size: 26,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Live Videos',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff1A1A1A)),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            height: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: videoList.length,
                    itemBuilder: (context, i) {
                      return VideoModelclass(modelClass: videoList[i]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18, top: 12),
                  child: Text(
                    'Recommend',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff1A1A1A)),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _controllers.length,
              itemBuilder: (context, index) {
                final mediaItem = mediaItems[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video Player
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: YoutubePlayer(
                          controller: _controllers[index],
                          showVideoProgressIndicator: true,
                          onReady: () => debugPrint("Ready"),
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(
                              isExpanded: true,
                              colors: const ProgressBarColors(
                                playedColor: Colors.red,
                                handleColor: Colors.white,
                              ),
                            ),
                            const PlaybackSpeedButton(),
                            FullScreenButton(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          // Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              mediaItem.imageUrl,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Texts
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mediaItem.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff323232),
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  mediaItem.subtitle,
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff464646),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: Center(
                                          child: Text(
                                            'React',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff1E1A15)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 36,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 27, left: 27, bottom: 76),
                                        child: SingleChildScrollView(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                'assets/images/likeimage.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                              Image.asset(
                                                'assets/images/smileemoji.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                              Image.asset(
                                                'assets/images/laughteremoji.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                              Image.asset(
                                                'assets/images/heartsmileemoji.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                              Image.asset(
                                                'assets/images/sademoji.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                              Image.asset(
                                                'assets/images/angeremoji.png',
                                                width: 36,
                                                height: 60,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/images/likelogo.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: Center(
                                          child: Text(
                                            'Whoops!',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff1E1A15)),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18),
                                        child: Text(
                                          'Create an account or log in to Auraq Publicatons to continue.',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff1E1A15)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 32,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ...List.generate(
                                                2,
                                                (index) => Expanded(
                                                        child: Container(
                                                      height: 50,
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5),
                                                      child: index == 0
                                                          ? ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Login()));
                                                              },
                                                              child: Text(
                                                                'Login',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xffFFFFFF)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                elevation: 0,
                                                                backgroundColor:
                                                                    Color(
                                                                        0xff209CEE),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12)),
                                                              ),
                                                            )
                                                          : ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Signup()));
                                                              },
                                                              child: Text(
                                                                'Sign up',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xff33333A)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      elevation:
                                                                          0,
                                                                      backgroundColor:
                                                                          Color(
                                                                              0xffFFFFFF),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12),
                                                                      ),
                                                                      side: BorderSide(
                                                                          width:
                                                                              0.5,
                                                                          color:
                                                                              Colors.black)),
                                                            ),
                                                    ))),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 29,
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/images/bookmarklogo.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Image.asset(
                            'assets/images/copypastelogo.png',
                            width: 24,
                            height: 24,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) {
                                  return Column(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 18),
                                        child: Center(
                                          child: Text(
                                            'Share',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff1E1A15)),
                                          ),
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 36,
                                              right: 36,
                                              top: 18,
                                              bottom: 81),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                'assets/images/whatsapplogo.png',
                                                width: 72,
                                                height: 80,
                                              ),
                                              Image.asset(
                                                'assets/images/twiitericonlogo.png',
                                                width: 72,
                                                height: 80,
                                              ),
                                              Image.asset(
                                                'assets/images/facebookiconlogo.png',
                                                width: 72,
                                                height: 80,
                                              ),
                                              Image.asset(
                                                'assets/images/youtubelogo.png',
                                                width: 72,
                                                height: 87,
                                              ),
                                              Image.asset(
                                                'assets/images/morelogoicon.png',
                                                width: 72,
                                                height: 80,
                                              ),
                                              Image.asset(
                                                'assets/images/shareattach.png',
                                                width: 72,
                                                height: 80,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/images/sendmsglogo.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    // if(index == _controllers.length - 1)
                    //   Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 18),
                    //         child: Center(
                    //           child: Text(
                    //             "That's all we have.",
                    //             style: TextStyle(
                    //                 fontSize: 18,
                    //                 fontWeight: FontWeight.w500,
                    //                 color: Color(0xff1E1A15)),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 15,
                    //       ),
                    //     ],
                    //   )// Add some space between each video item
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Mapping : Collection(list) mai mojood hr element ko kisi new form ya type
// mai transform krny ka process
