import 'package:flutter/material.dart';
import 'package:gezgo_travel_app/app/resources/app_assets.dart';
import 'package:gezgo_travel_app/ui/screens/signin_screen.dart';
import 'package:gezgo_travel_app/ui/style/app_text_styles.dart';

import '../widgets/onboard_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<Map<String, String>> onBoardingData = [
    {
      'backgroundImage': AppAssets.onboard_1,
      'title': 'DISCOVER',
      'description':
          'Join us to discover the most beautiful places in the world. Set sail for new adventures and collect unforgettable memories.',
    },
    {
      'backgroundImage': AppAssets.onboard_2,
      'title': 'EXPLORE',
      'description':
          'Explore diverse cultures, stunning landscapes, and vibrant cities. Let your wanderlust guide you to amazing destinations.',
    },
    {
      'backgroundImage': AppAssets.onboard_3,
      'title': 'ENJOY',
      'description':
          'Enjoy thrilling activities, relax in breathtaking natural surroundings, and create memories that will last a lifetime.',
    },
  ];

  int currentPageIndex = 0;
  final PageController _pageController = PageController();
  ScrollPhysics _scrollPhysics = const BouncingScrollPhysics();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: onBoardingData.length,
        controller: _pageController,
        physics: _scrollPhysics,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, i) {
          final data = onBoardingData[i];
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data['backgroundImage'].toString()),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppAssets.logo),
                            Row(
                              children: [
                                Text(
                                  data['title'].toString(),
                                  style: AppTextStyle.boardingFirstText,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          data['description'].toString(),
                          style: AppTextStyle.boardingSecondText,
                        ),
                        const SizedBox(
                          height: 420,
                        ),
                        OnBoardingButton(
                          text: _getButtonText(i),
                          onTap: () {
                            setState(() {
                              if (i < onBoardingData.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                );
                                _updatePagePhysics();
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninScreen()),
                                );
                              }
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _updatePagePhysics() {
    setState(() {
      _scrollPhysics = const BouncingScrollPhysics();
    });
  }

  String _getButtonText(int index) {
    if (index < onBoardingData.length - 1) {
      return 'Next';
    } else {
      return 'Continue';
    }
  }
}
