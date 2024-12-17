import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LoopingVideoWidget extends StatefulWidget {
  final String videoPath;
  final double? width;
  final double? height;
  final double? radius;


  const LoopingVideoWidget({Key? key, required this.videoPath, this.width, this.height, this.radius}) : super(key: key);

  @override
  _LoopingVideoWidgetState createState() => _LoopingVideoWidgetState();
}

class _LoopingVideoWidgetState extends State<LoopingVideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown
      })
      ..setLooping(true) // Enable looping
      ..play(); // Start playing the video
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Container(
      width: widget.width?? MediaQuery.of(context).size.width / 2.3,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded border
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius??12), // Apply the circular border
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    )
        : const Center(
      child: CircularProgressIndicator(),
    );
  }

}
