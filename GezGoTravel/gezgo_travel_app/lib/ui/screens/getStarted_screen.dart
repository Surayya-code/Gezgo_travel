import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/app/resources/app_assets.dart';
import 'package:gezgo_travel_app/ui/screens/onBoarding_screen.dart';
import 'package:gezgo_travel_app/ui/theme/app_colors.dart';
import 'package:gezgo_travel_app/ui/widgets/onboard_button.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
    final _formKey = GlobalKey<FormState>();
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

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
                      height: 140,
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
                      padding:
                        const  EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email isn't empty!";
                                       }else if(!emailRegex.hasMatch(value)){
                                          return "Enter Valid Email!";
                                       }
                                        return null;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Email address",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  OnBoardingButton(
                                    text: "Sign in",
                                    onTap: () {
                                      if(_formKey.currentState!.validate()){
                                        //const CircularProgressIndicator();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context)=>
                                            const OnBoardingScreen()));
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children:const [
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
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: AppColors.oppositeColor,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
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
