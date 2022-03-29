import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:f_tiktok/common/colors.dart';
import 'package:get/get.dart';
import 'package:f_tiktok/route/index.dart';

// import 'package:requests/requests.dart';

import 'home_tab_recommend.dart';

class Home extends StatefulWidget {
  late PageController _scrollPageController;
  HomePage({required PageController pageController}) {
    // this._scrollPageController = pageController;
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late double _screenHeight;
  late double _screenWidth;

  @override
  Future<void> initState() async {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
    _pageController = PageController(initialPage: 2, keepPage: true);
    // var r = await Requests.get(
    //     'http://127.0.0.1:4523/mock/697719/videos?page=1&pageSize=5&type=recommand');
    // r.raiseForStatus();
    // String body = r.content();
    // print(body);
  }

  @override
  void dispose() {
    _tabController.dispose();
    // _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      width: _screenWidth,
      height: _screenHeight,
      color: Colors.grey,
      child: Stack(children: [
        SizedBox(
          width: _screenWidth,
          height: MediaQueryData.fromWindow(window).padding.top,
        ),
        Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            child: _getContent()),
        Positioned(
            top: MediaQueryData.fromWindow(window).padding.top,
            child: _getTopLayout()),
      ]),
    );
  }

  _getTopLayout() {
    return SizedBox(
      width: _screenWidth,
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/live_btn.webp',
                width: 35,
                height: 35,
              ),
            ),
          ),
          _getTabBar(),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                'assets/images/search.webp',
                width: 35,
                height: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTabBar() {
    return Container(
      width: 200,
      height: 44,
      alignment: Alignment.center,
      child: TabBar(
        tabs: const [
          Text('成都'),
          Text('关注'),
          Text('推荐'),
        ],
        indicatorColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.only(bottom: 2),
        labelColor: Colors.white,
        unselectedLabelColor: ColorRes.color_2,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        controller: _tabController,
        onTap: (index) {
          // _pageController.animateToPage(index,
          //     duration: const Duration(milliseconds: 200),
          //     curve: Curves.linear);
        },
      ),
    );
  }

  _getContent() {
    double contentHeight =
        _screenHeight - 48 - MediaQueryData.fromWindow(window).padding.top;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: contentHeight,
        maxWidth: _screenWidth,
      ),
      child: PageView(
        controller: _pageController,
        children: [
          HomeTabRecomment(
            contentHeight: contentHeight,
          ),
        ],
        onPageChanged: (index) {
          _tabController.animateTo(index);
        },
      ),
    );
  }
}
