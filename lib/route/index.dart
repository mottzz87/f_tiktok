import 'package:get/get.dart';
import 'package:f_tiktok/page/home.dart';

///路由名称
class Routers {
  static const String home = '/home';
}

///路由管理者
class RouterManager {
  static final routes = [
    GetPage(name: Routers.home, page: () => Home()),
  ];
}
