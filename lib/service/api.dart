import 'package:f_tiktok/model/video_model.dart';

class Api {
  //获取推荐页面的视频列表
  static List<VideoModel> getRecommendVideoList() {
    List<VideoModel> list = [];
    for (int i = 0; i < 6; i++) {
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      // videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      // videoModel.favorite = false;
      // videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      // videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }
}

//视频本地标题
List<String> videoTitleList = [
  '信手拈来的从容，都是厚积薄发的沉淀。',
  '只有坚持别人无法坚持的坚持，才能拥有别人无法拥有的拥有。',
  '我于颓废中睁眼，亦从灰烬中重燃。',
  '光荣与梦想千篇一律，自律与忍耐万里挑一。',
  '你要知道，别人的辉煌在现在，而你的辉煌在未来。',
  '当你觉得坚持不下去的时候，恰恰是你需要坚持下去的时候。',
];

//视频作者
List<String> authorList = [
  '爱丽丝',
  '一条小团团',
  '伊素婉',
  '超级马里奥',
  '肖了个邦',
  '惠子',
];
//作者头像
List<String> authorHeaderUrlList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//视频本地地址
List<String> videoUrlList = [
  'assets/videos/video_0.mp4',
  'assets/videos/video_1.mp4',
  'assets/videos/video_2.mp4',
  'assets/videos/video_3.mp4',
  'assets/videos/video_4.mp4',
  'assets/videos/video_5.mp4',
];

//本地视频对应得gif
List<String> gifList = [
  'assets/images/video_0.gif',
  'assets/images/video_1.gif',
  'assets/images/video_2.gif',
  'assets/images/video_3.gif',
  'assets/images/video_4.gif',
  'assets/images/video_5.gif',
];

//视频音乐的名称
List<String> videoMusicNameList = [
  '《隐形的翅膀》- 张韶涵',
  '《挥着翅膀的女孩》 - 容祖儿',
  '《永不退缩》 - 任贤齐',
  '《最初的梦想》 - Remix',
  '《改变自己》 - 王力宏',
  '《奔跑》 - 羽泉',
];

//视频音乐的头像
List<String> videoMusicImageList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//个人页头部背景
List<String> headerBgImageList = [
  'assets/images/bg_0.jpg',
  'assets/images/bg_1.jpg',
  'assets/images/bg_2.jpg',
  'assets/images/bg_3.jpg',
  'assets/images/bg_4.jpg',
  'assets/images/bg_5.jpg',
];

//个人页简介
List<String> introductionList = [
  '能让人感觉到快乐的不是只有爱情\n还有努力之后的成就感',
  '要悄悄地努力\n会有人在尽头处等你',
  '工作很累\n生活很闷\n但是走过这些艰苦的日子\n迎接你的就是锦绣前程',
  'Calm your mind\n secretly become very strong',
  '心里装着希望\n全力以赴\n才能不负自己',
  '现在付出更多的努力\n未来才会有更多的选择',
];
