import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/screens/main_screen.dart';
import 'package:openjobs/screens/sign_up_screen.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:openjobs/widgets/buttons/opx_colored_button.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "OpenJobs",
                  style: TextStyle(
                    fontSize: 36,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontFamily: "transit",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                OpenXInput(
                  leadingIcon: Icon(LineAwesomeIcons.envelope),
                  hint: 'Email Address',
                ),
                const SizedBox(height: 24),
                OpenXInput(
                  leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                  hint: 'Email Address',
                ),
                const SizedBox(height: 24),
                InkWell(child: Text("Forgot Password ?")),
                const SizedBox(height: 24),
                OpxMaterialButton(text: "Sign In", onPressed: () {}),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () => Get.to(() => SignUpScreen()),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Dont have account ? "),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemerUtil.getPaint(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),
                OpxColoredButton(
                  text: "Continue Without Account",
                  onPressed: () => Get.to(() => MainScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
