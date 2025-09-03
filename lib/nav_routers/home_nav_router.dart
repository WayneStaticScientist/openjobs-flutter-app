import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/navigations/home_nav.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeNavRouter {
  static List<Widget> navs = [HomeNav(), SizedBox(), SizedBox(), SizedBox()];
  static List<BottomBarItem> navsItems = [
    BottomBarItem(
      icon: Icon(LineAwesomeIcons.home_solid),
      title: Text("home"),
      selectedColor: ThemerUtil.getPaint(),
      unSelectedColor: ThemerUtil.getPaint(),
    ),
    BottomBarItem(
      icon: Icon(LineAwesomeIcons.heart),
      title: Text("Likes"),
      selectedColor: ThemerUtil.getPaint(),
      unSelectedColor: ThemerUtil.getPaint(),
    ),
    BottomBarItem(
      icon: Icon(LineAwesomeIcons.archive_solid),
      title: Text("Uploads"),
      selectedColor: ThemerUtil.getPaint(),
      unSelectedColor: ThemerUtil.getPaint(),
    ),
    BottomBarItem(
      icon: Icon(LineAwesomeIcons.cog_solid),
      title: Text("Settings"),
      selectedColor: ThemerUtil.getPaint(),
      unSelectedColor: ThemerUtil.getPaint(),
    ),
  ];
}
