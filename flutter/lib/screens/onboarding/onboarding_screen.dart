import 'package:flutter/material.dart';
import 'package:rekhdekh/screens/onboarding/intro_1.dart';
import 'package:rekhdekh/screens/onboarding/intro_2.dart';
import 'package:rekhdekh/screens/onboarding/intro_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
//controller for pageview
  final PageController _controller = PageController();
  bool _isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            if (index == 2) {
              setState(() {
                _isLast = true;
              });
            } else {
              setState(() {
                _isLast = false;
              });
            }
          },
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Intro1(),
            const Intro2(),
            const Intro3(),
          ],
        ),

        //dot indicator
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              children: [
                //skip button
                GestureDetector(
                  child: const Text('Skip'),
                  onTap: () {
                    //  Navigator.pushReplacementNamed(context, '/homescreen');
                  },
                ),

                SmoothPageIndicator(controller: _controller, count: 9),

                //next button
                _isLast
                    ? GestureDetector(
                        child: const Text('Done'),
                        onTap: () {
                          // Navigator.pushReplacementNamed(context, '/homescreen');
                        },
                      )
                    : GestureDetector(
                        child: const Text('Next'),
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                      ),
              ],
            ))
      ],
    ));
  }
}
