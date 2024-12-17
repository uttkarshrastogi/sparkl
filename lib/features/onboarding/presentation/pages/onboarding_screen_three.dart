import 'package:brainboost/features/onboarding/presentation/widgets/animated_background.dart';
import 'package:brainboost/features/onboarding/presentation/widgets/camera_widget.dart';
import 'package:brainboost/features/onboarding/presentation/widgets/looping_video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/boost_button.dart';
import '../widgets/animated_chat_bubble.dart';
int _currentIndex = 3;
class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBlurredBalls(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: [
                  Image.asset('assets/sparkl_logo.png', height: 30),
                ],
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                "Doubt Resolution with Teachers",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),

              // Chat Bubbles
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Stack(
                      children: [
                        AnimatedChatBubble(
                          message:
                          "Do you want to go over how to apply the quadratic formula?",
                          bubbleType: BubbleType.sendBubble,
                          delay: const Duration(seconds: 1),
                        ),
                        Positioned(
                          child: Hero(
                            tag:"video",
                              child: LoopingVideoWidget(videoPath: "assets/teachervideo.mp4",width: 50,height: 50,radius: 200,)),
                          right: 0,
                        ),

                      ],
                    ),
                    SizedBox(height: 40),
                    Stack(
                      children: [
                        AnimatedChatBubble(
                          message: "Yes, I’m confused about when to use it.",
                          bubbleType: BubbleType.receiverBubble,
                          delay: const Duration(seconds: 2),
                        ),
                        Positioned(child: CameraWidget(),left: -10,top: -10,width: 60,height: 60,),

                      ],
                    ),
                    SizedBox(height: 40),
                    Stack(
                      children: [
                        AnimatedChatBubble(
                          message:
                          "You use it when the equation is in the form ax² + bx + c = 0. Let me show you a quick example to clarify.",
                          bubbleType: BubbleType.sendBubble,
                          delay: const Duration(seconds: 3),
                        ),
                        Positioned(
                          child: Hero(
                              tag:"video",
                              child: LoopingVideoWidget(videoPath: "assets/teachervideo.mp4",width: 50,height: 50,radius: 200,)),
                          right: 0,
                        ),
                      ],
                    ),



                  ],
                ),
              ),

              // Bottom Buttons
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

  Widget _chatBubble(String text, BubbleType type, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: type == BubbleType.sendBubble
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (type == BubbleType.receiverBubble)
            CircleAvatar(backgroundImage: AssetImage(imagePath)),
          const SizedBox(width: 8),
          ChatBubble(
            clipper: ChatBubbleClipper1(type: type),
            alignment: type == BubbleType.sendBubble
                ? Alignment.topRight
                : Alignment.topLeft,
            margin: const EdgeInsets.only(top: 10),
            backGroundColor: type == BubbleType.sendBubble
                ? const Color(0xFFFDE47D)
                : Colors.white,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 230),
              child: Text(
                text,
                style: TextStyle(
                  color: type == BubbleType.sendBubble
                      ? Colors.black87
                      : Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (type == BubbleType.sendBubble) const SizedBox(width: 8),
          if (type == BubbleType.sendBubble)
            CircleAvatar(backgroundImage: AssetImage(imagePath)),
        ],
      ),
    );
  }

  Widget _navigationButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFFFDE47D),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
    );
  }

  Widget _getStartedButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Get Started!")),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: const Color(0xFFFDE47D),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}


