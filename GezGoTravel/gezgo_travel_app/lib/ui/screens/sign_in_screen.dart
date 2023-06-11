import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/app/resources/app_assets.dart';
import 'package:gezgo_travel_app/ui/screens/forgot_password_screen.dart';
import 'package:gezgo_travel_app/ui/screens/home_screen.dart';
import 'package:gezgo_travel_app/ui/theme/app_colors.dart';
import 'package:gezgo_travel_app/ui/widgets/onboard_button.dart';

import '../widgets/global_text_input.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final emailFocus = FocusNode();
  final passwFocus = FocusNode();
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    emailFocus.dispose();
    passwFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.getStarted,
                  ),
                  fit: BoxFit.fill),
            ),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.colorWhite,
                        ),
                        child: Image.asset(AppAssets.logo),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Sign In ",
                                    style: TextStyle(
                                        color: AppColors.colorBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Password isn't empty!";
                                      } else if (value.length < 6) {
                                        return "Password must not be less than 6 characters!";
                                      }
                                      return null;
                                    },
                                    controller: passController,
                                    focusNode: passwFocus,
                                    obscureText: true,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  OnBoardingButton(
                                    text: "Sign in",
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        //const CircularProgressIndicator();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                        );
                                        emailController.clear();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: const [
                                      Expanded(
                                          child: Divider(
                                              thickness: 1.0,
                                              color: AppColors.grey)),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text("OR"),
                                      ),
                                      Expanded(
                                          child: Divider(
                                              thickness: 1.0,
                                              color: AppColors.grey)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 10.0),
                                        child: SocialMediaButton(
                                          image:
                                              "assets/images/logos_google-icon.png",
                                          bgColor: AppColors.colorWhite,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 10.0),
                                        child: SocialMediaButton(
                                          image: "assets/images/Vector.png",
                                          bgColor: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.0, bottom: 10.0),
                                        child: SocialMediaButton(
                                          image: "assets/images/Facebook.png",
                                          bgColor: AppColors.colorWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                 const SizedBox(height: 10,),
                                   InkWell(
                                    onTap: (){
                                       Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgotPasswordScreen()));
                                    },
                                     child: const Text(
                                            "Forgot password?",
                                            style: TextStyle(
                                                color: AppColors.oppositeColor,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                   ),
                                      
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       const Text("Don't have account? "),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()));
                                        },
                                        child: const Text(
                                          "Sign Up",
                                          style: TextStyle(
                                              color: AppColors.oppositeColor,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("By registering you agree to our"),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Terms of Service",
                                        style: TextStyle(
                                          color: AppColors.mainColor,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
      )),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String image;
  final Color bgColor;
  const SocialMediaButton({
    super.key,
    required this.image,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(image),
      ),
    );
  }
}
