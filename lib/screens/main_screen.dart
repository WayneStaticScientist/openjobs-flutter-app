import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openjobs/controllers/jobs_controller.dart';
import 'package:openjobs/nav_routers/home_nav_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _jobsController = JobsController();
  @override
  void initState() {
    super.initState();
    _jobsController.findJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeNavRouter.navs[_selectedIndex],
      bottomNavigationBar: StylishBottomBar(
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        currentIndex: _selectedIndex,
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        items: HomeNavRouter.navsItems,
        option: DotBarOptions(dotStyle: DotStyle.tile, inkColor: Colors.white),
      ),
    );
  }
}
