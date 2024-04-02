import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:white_fullscreen/widgets/color_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool _isFullscreen = true;

  Color _backgroundColor = Colors.white;
  Color? _selectedColor;

  @override
  initState() {
    super.initState();

    SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
      setState(() {
        _isFullscreen = !systemOverlaysAreVisible;
      });
    });
  }

  void setFullscreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: const Text('Select background color'),
                    content: ColorPicker(
                      selectedColor: _backgroundColor,
                      onColorChanged: (selectedColor) {
                        _selectedColor = selectedColor;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);

                          setState(() {
                            _backgroundColor = _selectedColor!;
                          });
                        },
                        child: const Text('SELECT'),
                      ),
                    ],
                  ));
        },
      ),
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
