import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              }, icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Home Page"),
          centerTitle: true,
        ),
      body: Container(
        child: const Text("HomeScreen"),
      ),
    );
  }
}