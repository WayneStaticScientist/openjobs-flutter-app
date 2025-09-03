import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                Row(
                  children: [
                    Expanded(
                      child: OpenXInput(
                        leadingIcon: Icon(LineAwesomeIcons.user),
                        hint: "First Name",
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: OpenXInput(
                        leadingIcon: Icon(LineAwesomeIcons.user),
                        hint: "LastName",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                OpenXInput(
                  leadingIcon: Icon(LineAwesomeIcons.envelope),
                  hint: 'Email Address',
                ),
                const SizedBox(height: 24),
                OpenXInput(
                  leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                  hint: 'Password',
                ),
                const SizedBox(height: 24),
                OpenXInput(
                  leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                  hint: 'Confirm Password',
                ),
                const SizedBox(height: 24),
                OpxMaterialButton(text: "Sign Up", onPressed: () {}),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () => Get.back(),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: "Already have account ? "),
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemerUtil.getPaint(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
