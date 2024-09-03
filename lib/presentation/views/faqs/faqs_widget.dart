// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class YoutubeVideos extends StatefulWidget{
//   @override
//   State<YoutubeVideos> createState() => _YoutubeVideosState();
// }
//
// class _YoutubeVideosState extends State<YoutubeVideos> {
//   List<MediaItem> mediaItems = [
//     MediaItem(videoURL: "", imgURL: "", title: "", subtitle : ""),
//     MediaItem(videoURL: "", imgURL: "", title: "", subtitle : ""),
//     MediaItem(videoURL: "", imgURL: "", title: "", subtitle : ""),
//     MediaItem(videoURL: "", imgURL: "", title: "", subtitle : ""),
//   ];
//   late List<YoutubePlayerController> _controllers;
//
//
//   @override
//   void initState() {
//      super.initState();
//      _controllers = mediaItems.map<YoutubePlayerController>((videos){
//        final videoID = YoutubePlayer.convertUrlToId(videos.videoURL);
//        if(videoID == null) {
//          throw Exception("Invalid URL");
//        }
//        return YoutubePlayerController(initialVideoId: videoID,
//        flags: YoutubePlayerFlags(mute: false, autoPlay: false));
//      }).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Youtube Player'),),
//       body: getBody(context),
//     );
//   }
//
//   Widget getBody(BuildContext context) {
//     return
//   }
// }
//  class MediaItem {
//   final String videoURL;
//   final String imgURL;
//   final String title;
//   final String subtitle;
//
//   MediaItem({required this.videoURL, required this.imgURL, required this.title, required this.subtitle});
//
//  }
