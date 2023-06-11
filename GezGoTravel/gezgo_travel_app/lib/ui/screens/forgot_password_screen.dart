import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Forgot Screen"),
          centerTitle: true,
        ),
      body: Container(
        child: Text("Forgot password?"),
      ),
    );
  }
}