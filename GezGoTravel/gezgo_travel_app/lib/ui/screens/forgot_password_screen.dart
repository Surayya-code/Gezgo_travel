import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/ui/screens/sign_in_screen.dart';
import 'package:gezgo_travel_app/ui/widgets/global_text_input.dart';

import '../theme/app_colors.dart';
import '../widgets/onboard_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    late bool passToggle = true;
    final _formKey = GlobalKey<FormState>();
    final passController = TextEditingController();
      final confirmPassController = TextEditingController();
      final confirmPasswFocus = FocusNode();
    final passwFocus = FocusNode();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("New Password"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              const Text(
                  "Please choose a new password for *****************@gmail.com. Make sure your new password must be more than six characters and numbers for a strong pasword."),
              const SizedBox(
                height: 10,
              ),
              GlobalTextInput(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "New Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password isn't empty!";
                    } else if (value.length < 6) {
                      return "Password must not be less than 6 characters!";
                    }
                    return null;
                  },
                  obscureText: passToggle,
                  focusNode: passwFocus,
                  controller: passController),
                   const SizedBox(
                height: 10,
              ),
                   GlobalTextInput(
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Confirm new Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password isn't empty!";
                    } else if (value.length < 6) {
                      return "Password must not be less than 6 characters!";
                    }
                    return null;
                  },
                  obscureText: passToggle,
                  focusNode: passwFocus,
                  controller: passController),
                   const SizedBox(
                height: 20,
              ),
              OnBoardingButton(
                      text: "Reset Password",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (passController.text == confirmPassController.text) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                            
                            passController.clear();
                           
                          }
                        }
                      },
                    ),
            ]),
          ),
        ),
      ),
    );
  }
}
