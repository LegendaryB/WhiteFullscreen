import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isFullscreen = true;

  void setFullscreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  initState() {
    super.initState();

    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
      setState(() {
        _isFullscreen = !systemOverlaysAreVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      extendBodyBehindAppBar: true,
      floatingActionButton: AnimatedOpacity(
          opacity: !_isFullscreen ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton(
            onPressed: setFullscreen,
            child: const Icon(Icons.fullscreen),
          )),
    );
  }
}
