import 'dart:ui';
import 'package:f_tiktok/common/colors.dart';
import 'package:flutter/material.dart';

import 'package:f_tiktok/model/video_model.dart';
import 'package:video_player/video_player.dart';

import '../../common/event_bus.dart';
import '../../common/screen.dart';

class VideoWidget extends StatefulWidget {
  VideoModel videoModel;
  bool showFocusButton;
  double contentHeight;
  Function onClickHeader;
  VideoWidget(
      {Key? key,
      required this.videoModel,
      required this.showFocusButton,
      required this.contentHeight,
      required this.onClickHeader})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPlayerController;
  final _playing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(widget.videoModel.videoUrl);
    _videoPlayerController.initialize();
    _videoPlayerController.setLooping(true);

    App.bus.on<StopPlayEvent>().listen((event) {
      // _videoPlayerController.pause();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1;
    double videoLayoutWidth = 100;
    double videoLayoutHeight = 200;

    double rateWidthHeightContent = screenWidth(context) / widget.contentHeight;
    double rateWidthContentVideo =
        screenWidth(context) / _videoPlayerController.value.size.width;
    double heightVideoByRate =
        _videoPlayerController.value.size.height * rateWidthContentVideo;
    if (widget.contentHeight > heightVideoByRate) {
      double rateHeightContentVideo =
          widget.contentHeight / _videoPlayerController.value.size.height;
      videoLayoutHeight = heightVideoByRate;
      videoLayoutWidth = screenWidth(context);
      scale = widget.contentHeight / videoLayoutHeight;
      print(
          'width:$videoLayoutWidth height:$videoLayoutHeight scale:$scale rate:$rateHeightContentVideo');
    }
    return Scaffold(
      backgroundColor: ColorRes.color_1,
      body: Stack(children: [
        _getVideoPlayer(videoLayoutWidth, videoLayoutHeight, scale)
      ]),
    );
  }

  _getVideoPlayer(
      double videoLayoutWidth, double videoLayoutHeight, double scale) {
    return Stack(
      children: [
        Transform.scale(
          scale: scale,
          alignment: Alignment.topCenter,
          child: Container(
              width: videoLayoutWidth,
              height: videoLayoutHeight,
              child: VideoPlayer(_videoPlayerController)),
        ),
        // _playing == true? Container() : _getPauseButton(),
      ],
    );
  }
}

class StopPlayEvent {}
