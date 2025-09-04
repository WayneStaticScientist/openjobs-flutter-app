import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/screens/main_screen.dart';
import 'package:openjobs/screens/sign_up_screen.dart';
import 'package:openjobs/services/auth/user_auth.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:openjobs/utils/toast_marker.dart';
import 'package:openjobs/widgets/buttons/opx_colored_button.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = false;
  final _userAuth = UserAuth();
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _key,
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
                    controller: _emailController,
                    validate: (value) =>
                        value!.trim().isEmpty ? "email is required" : null,
                    leadingIcon: Icon(LineAwesomeIcons.envelope),
                    hint: 'Email Address',
                  ),
                  const SizedBox(height: 24),
                  OpenXInput(
                    passwordField: true,
                    controller: _passwordController,
                    validate: (value) =>
                        value!.trim().isEmpty ? "Password is required" : null,
                    leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                    hint: 'Password',
                  ),
                  const SizedBox(height: 24),
                  InkWell(child: Text("Forgot Password ?")),
                  const SizedBox(height: 24),
                  OpxMaterialButton(
                    text: "Sign In",
                    onPressed: _loginAccount,
                    loading: _loading,
                  ),
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
      ),
    );
  }

  _loginAccount() async {
    if (!(_key.currentState!.validate()) || _loading) {
      return;
    }
    setState(() {
      _loading = true;
    });
    try {
      await _userAuth.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ToastMarker.success("SignIn Success");
      Get.offAll(() => MainScreen());
    } catch (e) {
      ToastMarker.error("$e");
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }
}
