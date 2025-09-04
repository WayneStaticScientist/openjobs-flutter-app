import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openjobs/screens/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  _redirect() async {
    await Future.delayed(Duration.zero);
    Supabase.instance.client.auth.currentSession;
    if (!mounted) return;
    Get.offAll(() => MainScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "OpenJobs",
              style: TextStyle(fontFamily: "transit", fontSize: 32),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
