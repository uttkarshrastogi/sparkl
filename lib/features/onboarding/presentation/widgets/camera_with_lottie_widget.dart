import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CameraWithLottieWidget extends StatefulWidget {
  final double width;
  final double height;

  const CameraWithLottieWidget({Key? key, this.width = 100, this.height = 150}) : super(key: key);

  @override
  _CameraWithLottieWidgetState createState() => _CameraWithLottieWidgetState();
}

class _CameraWithLottieWidgetState extends State<CameraWithLottieWidget> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initializeCamera();
  }

  // Initialize the front camera
  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      _controller = CameraController(frontCamera, ResolutionPreset.medium);
      await _controller.initialize();
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      child: CameraPreview(_controller),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: -10,
                child: _buildLabel(
                  'Holistic Well-Being',
                  'assets/blue_book.png', // Replace with your icon path
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: _buildLabel(
                  'Holistic Well-being',
                  'assets/pre_read_selected.png', // Replace with your icon path
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: _buildLabel(
                  'Doubt Clarification',
                  'assets/pre_read_selected.png', // Replace with your icon path
                ),
              ),
              Positioned(
                top: 10,
                left: 0,
                child: _buildIcon(
                  'Holistic Well-Being',
                  'assets/blue_book.png', // Replace with your icon path
                ),
              ),
              Positioned(
                bottom: 70,
                left: 0,
                child: _buildIcon(
                  'Doubt Clarification',
                  'assets/pre_read_selected.png', // Replace with your icon path
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Failed to initialize camera"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

Widget _buildIcon(String text, String iconPath) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Circular Icon with Image
      DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.amber,
        radius: const Radius.circular(300),
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Image.asset(iconPath), // Icon Image
        ),
      ),
    ],
  );
}

Widget _buildLabel(String text, String iconPath) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Circular Icon with Image
      DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.amber,
        radius: const Radius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    ],
  );
}
