import 'package:brainboost/features/onboarding/presentation/pages/onboarding_screen_three.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/boost_button.dart';
import '../widgets/animated_background.dart';
import '../widgets/camera_widget.dart';
import '../widgets/looping_video_widget.dart';
import '../widgets/stack_card.dart';

int _currentIndex = 2;

class OnboardingScreenTwo extends StatelessWidget {

  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBlurredBalls(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sparkl Logo
              Hero(
                tag: 1,
                child: Image.asset(
                  'assets/sparkl_logo.png', // Replace with your asset path
                  height: 30,
                ),
              ),
              const SizedBox(height: 20),
              // Main Heading
              const Hero(
                tag: 2,
                child: Text(
                  "1-on-1 Live Classes",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Subheading
              const Hero(
                tag: 3,
                child: Text(
                  "Learning Customied for Every Student",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag:"video",
                          child: LoopingVideoWidget(
                            videoPath: 'assets/teachervideo.mp4',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 400,
                        child: Stack(
                          children: [
                            StackedCards(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CameraWidget(
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              // Lottie Animation
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 48,
                          width: 48,
                          child: CircularProgressIndicator(
                            value: _currentIndex / 3, // Adjust progress dynamically
                            color: const Color(0xFFFDE47D),
                            backgroundColor: Colors.black12,
                            strokeWidth: 4,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_back, // Arrow Icon
                          size: 24,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: BoostButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return OnboardingScreenThree(
                              );
                            }));
                      },
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
