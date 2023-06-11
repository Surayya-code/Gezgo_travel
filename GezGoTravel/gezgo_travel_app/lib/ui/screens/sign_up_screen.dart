import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/ui/theme/app_colors.dart';
import 'package:gezgo_travel_app/ui/widgets/global_text_input.dart';

import '../widgets/onboard_button.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final usernameFocus = FocusNode();
  final passwFocus = FocusNode();
  final confirmPasswFocus = FocusNode();
  late bool passToggle = true;
  late bool confirmPassToggle = true;
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    usernameFocus.dispose();
    passwFocus.dispose();
    confirmPasswFocus.dispose();
    emailFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Sign Up"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi, Welcome Gezgo Travel",
                    style: TextStyle(
                        color: AppColors.oppositeColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GlobalTextInput(
                    keyboardType: TextInputType.text,
                    hintText: "Username",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username isn't empty!";
                      } else if (value.length < 3) {
                        return "Username must not be less than 3 characters!";
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: usernameController,
                    focusNode: usernameFocus,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GlobalTextInput(
                    regex: emailRegex,
                    keyboardType: TextInputType.emailAddress,
                    hintText: "Email address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email isn't empty!";
                      } else if (!emailRegex.hasMatch(value)) {
                        return "Enter Valid Email!";
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: emailController,
                    focusNode: emailFocus,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GlobalTextInput(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password",
                    obscureText: passToggle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password isn't empty!";
                      } else if (value.length < 6 &&
                          passController.text != confirmPassController.text) {
                        return "Password must not be less than 6 characters!";
                      }
                      return null;
                    },
                    controller: passController,
                    focusNode: passwFocus,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GlobalTextInput(
                    keyboardType: TextInputType.visiblePassword,
                    hintText: "Password confirm",
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          confirmPassToggle = !confirmPassToggle;
                        });
                      },
                      child: Icon(confirmPassToggle
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                    obscureText: confirmPassToggle,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password Confirm isn't empty!";
                      } else if (confirmPassController.text !=
                          passController.text) {
                        return "Password must match!";
                      }
                      return null;
                    },
                    controller: confirmPassController,
                    focusNode: confirmPasswFocus,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OnBoardingButton(
                    text: "Sign up",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (passController.text == confirmPassController.text) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                          usernameController.clear();
                          passController.clear();
                          confirmPassController.clear();
                          emailController.clear();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
