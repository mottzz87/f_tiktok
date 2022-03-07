import 'dart:ui';
import 'package:f_tiktok/page/widget/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/recommend.dart';

class HomeTabRecomment extends StatefulWidget {
  double contentHeight;
  PageController? pageController;
  HomeTabRecomment({Key? key, required this.contentHeight, this.pageController})
      : super(key: key);

  @override
  State<HomeTabRecomment> createState() => _HomeTabRecommentState();
}

class _HomeTabRecommentState extends State<HomeTabRecomment> {
  final RecommendPageController _controller =
      Get.put(RecommendPageController());
  final PageController _pageController = PageController(keepPage: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        print(_controller.videoList[index]);
        return VideoWidget(
            videoModel: _controller.videoList[index],
            showFocusButton: true,
            contentHeight: widget.contentHeight,
            onClickHeader: () {
              // widget.pageController.nextPage(
              //     duration: const Duration(milliseconds: 200),
              //     curve: Curves.linear);
            });
      },
      onPageChanged: (index) {
        print(index);
      },
    );
  }
}
