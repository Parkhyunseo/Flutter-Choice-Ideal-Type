import 'package:flutter/material.dart';

/*
final ExactAssetImage girl1 = ExactAssetImage('assets/경리.jpg');
final ExactAssetImage girl2 = ExactAssetImage('assets/김소현.jpg');
final ExactAssetImage girl3 = ExactAssetImage('assets/다현.jpg');
final ExactAssetImage girl4 = ExactAssetImage('assets/박신혜.jpg');
final ExactAssetImage girl5 = ExactAssetImage('assets/사나.jpg');
final ExactAssetImage girl6 = ExactAssetImage('assets/설현.jpg');
final ExactAssetImage girl7 = ExactAssetImage('assets/손나은.jpg');
final ExactAssetImage girl8 = ExactAssetImage('assets/수지.jpg');
final ExactAssetImage girl9 = ExactAssetImage('assets/아이린.jpg');
final ExactAssetImage girl10 = ExactAssetImage('assets/아이유.jpg');
final ExactAssetImage girl11 = ExactAssetImage('assets/정채연.jpg');
final ExactAssetImage girl12 = ExactAssetImage('assets/쯔위.jpg');
final ExactAssetImage girl13 = ExactAssetImage('assets/태연.jpg');
final ExactAssetImage girl14 = ExactAssetImage('assets/한지민.jpg');
final ExactAssetImage girl15 = ExactAssetImage('assets/한효주.jpg');
final ExactAssetImage girl16 = ExactAssetImage('assets/혜리.jpg');
*/

final Content girl1 = Content(image:ExactAssetImage('assets/경리.jpg'), name: "나인뮤지스 경리");
final Content girl2 = Content(image:ExactAssetImage('assets/김소현.jpg'), name: "김소현");
final Content girl3 = Content(image:ExactAssetImage('assets/다현.jpg'), name: "트와이스 다현");
final Content girl4 = Content(image:ExactAssetImage('assets/박신혜.jpg'), name: "박신혜");
final Content girl5 = Content(image:ExactAssetImage('assets/사나.jpg'), name: "트와이스 사나");
final Content girl6 = Content(image:ExactAssetImage('assets/설현.jpg'), name: "AOA 설현");
final Content girl7 = Content(image:ExactAssetImage('assets/손나은.jpg'), name: "에이핑크 손나은");
final Content girl8 = Content(image:ExactAssetImage('assets/수지.jpg'), name: "수지");
final Content girl9 = Content(image:ExactAssetImage('assets/아이린.jpg'), name: "레드벨벳 아이린");
final Content girl10 = Content(image:ExactAssetImage('assets/아이유.jpg'), name: "아이유");
final Content girl11 = Content(image:ExactAssetImage('assets/정채연.jpg'), name: "다이아 정채연");
final Content girl12 = Content(image:ExactAssetImage('assets/쯔위.jpg'), name: "트와이스 쯔위");
final Content girl13 = Content(image:ExactAssetImage('assets/태연.jpg'), name: "소녀시대 태연");
final Content girl14 = Content(image:ExactAssetImage('assets/한지민.jpg'), name: "한지민");
final Content girl15 = Content(image:ExactAssetImage('assets/한효주.jpg'), name: "한효주");
final Content girl16 = Content(image:ExactAssetImage('assets/혜리.jpg'), name: "걸스데이 혜리");

List<Content> img = [girl1, girl2, girl3, girl4, girl5, girl6, girl7, girl8, girl9, girl10, girl11, girl12, girl13, girl14, girl15, girl16];

class Content{
  ExactAssetImage image;
  String name;

  Content({this.image, this.name});
}