import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget{
  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  List<MediaItem> mediaItems= [
    MediaItem(VideoURL: "", imgUrl: "", title: "", description: ""),
    MediaItem(VideoURL: "", imgUrl: "", title: "", description: ""),
    MediaItem(VideoURL: "", imgUrl: "", title: "", description: ""),
    MediaItem(VideoURL: "", imgUrl: "", title: "", description: ""),
  ];

    late List<YoutubePlayerController> _controllers;


  @override
  void initState() {
    super.initState();
    _controllers = mediaItems.map<YoutubePlayerController>((videos) {
      final videoID = YoutubePlayer.convertUrlToId(videos.VideoURL);
      if(videoID == null) {
        throw Exception("Invalid URL ${videoID}");
      }
      return YoutubePlayerController(initialVideoId: videoID,
      flags:  YoutubePlayerFlags(mute: false, autoPlay: false));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Youtube Player'),
      centerTitle: true,),
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}

class MediaItem{
  final String VideoURL;
  final String imgUrl;
  final String title;
  final String description;

  MediaItem({required this.VideoURL, required this.imgUrl, required this.title, required this.description});

}