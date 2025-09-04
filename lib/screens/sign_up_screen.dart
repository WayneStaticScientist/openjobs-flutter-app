import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:openjobs/screens/main_screen.dart';
import 'package:openjobs/utils/themer_util.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:openjobs/services/auth/user_auth.dart';
import 'package:openjobs/utils/toast_marker.dart';
import 'package:openjobs/widgets/buttons/opx_material_button.dart';
import 'package:openjobs/widgets/input/opx_material_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _loading = false;
  final _userAuth = UserAuth();
  final _dob = TextEditingController();
  final _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _lastName = TextEditingController();
  final _passWord = TextEditingController();
  final _firstName = TextEditingController();
  final _confirmPassWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                          controller: _firstName,
                          validate: (data) => data!.trim().isEmpty
                              ? "First Name is required"
                              : (data.split(" ").length > 2
                                    ? "Name should not contain Spaces"
                                    : null),
                          leadingIcon: Icon(LineAwesomeIcons.user),
                          hint: "First Name",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OpenXInput(
                          controller: _lastName,
                          validate: (data) => data!.trim().isEmpty
                              ? "Last Name is required"
                              : (data.split(" ").length > 2
                                    ? "LastName should not contain Spaces"
                                    : null),
                          leadingIcon: Icon(LineAwesomeIcons.user),
                          hint: "LastName",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  OpenXInput(
                    controller: _email,
                    validate: (data) => data!.trim().isEmpty
                        ? "Email Address is required"
                        : null,
                    leadingIcon: Icon(LineAwesomeIcons.envelope),
                    hint: 'Email Address',
                  ),
                  const SizedBox(height: 24),
                  OpenXInput(
                    controller: _dob,
                    validate: (value) => value!.split("/").length != 3
                        ? "Please enter valid date of birth e.g 6/2/2021 for 6 Feb 2021"
                        : null,
                    leadingIcon: Icon(LineAwesomeIcons.calendar),
                    hint: 'Date Of Birth dd/mm/year',
                  ),
                  const SizedBox(height: 24),
                  OpenXInput(
                    controller: _passWord,
                    passwordField: true,
                    validate: (data) =>
                        data!.trim().isEmpty ? "Password is required" : null,
                    leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                    hint: 'Password',
                  ),
                  const SizedBox(height: 24),
                  OpenXInput(
                    controller: _confirmPassWord,
                    validate: (value) => _passWord.text != value
                        ? "Passwords do not match"
                        : null,
                    passwordField: true,
                    leadingIcon: Icon(LineAwesomeIcons.lock_open_solid),
                    hint: 'Confirm Password',
                  ),
                  const SizedBox(height: 24),
                  OpxMaterialButton(
                    loading: _loading,
                    text: "Sign Up",
                    onPressed: _createAccount,
                  ),
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
      ),
    );
  }

  _createAccount() async {
    if (!(_formKey.currentState!.validate()) || _loading) {
      return;
    }
    setState(() {
      _loading = true;
    });
    try {
      final message = await _userAuth.signUp(
        firstName: _firstName.text.trim(),
        lastName: _lastName.text.trim(),
        email: _email.text.trim(),
        dateOfBirth: _dob.text,
        password: _passWord.text,
      );
      ToastMarker.success(message);
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
