import 'package:flutter/material.dart';

import '../../../core/widgets/boost_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BoostButton(text: 'START PLAYING', onPressed: () {  },),
          ),
        ],
      ),
    );
  }
}
