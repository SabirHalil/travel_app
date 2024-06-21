import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:video_player/video_player.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = VideoPlayerController.asset('assets/videos/sayfa1.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller1.setLooping(true);
        _controller1.play();
      });
    _controller2 = VideoPlayerController.asset('assets/videos/sayfa2.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller2.setLooping(true);
        _controller2.play();
      });
    _controller3 = VideoPlayerController.asset('assets/videos/sayfa3.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller3.setLooping(true);
        _controller3.play();
      });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: OnBoardingSlider(
        totalPage: 3,
        headerBackgroundColor: Colors.white,
        background: [
          _buildVideoBackground(_controller1),
          _buildVideoBackground(_controller2),
          _buildVideoBackground(_controller3)
        ],
        speed: 1.8,
        pageBodies: [
          _buildPageBody(),
          _buildPageBody(),
          _buildPageBody(),
        ],
      ),
    );
  }

  Widget _buildVideoBackground(VideoPlayerController controller) {
    return SizedBox(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: VideoPlayer(controller));
  }

  Widget _buildPageBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 50),
          Text(
            'Welcome to Flutter Onboarding Slider',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'This is a simple onboarding slider for Flutter.',
            style: TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
