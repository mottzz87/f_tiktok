import 'package:f_tiktok/route/index.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

void main() {
  runApp(OKToast(
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.leftToRight,
          getPages: RouterManager.routes,
          initialRoute: Routers.home)));
}
