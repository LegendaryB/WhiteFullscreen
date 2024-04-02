import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:white_fullscreen/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  WakelockPlus.enable();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'White Fullscreen',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme:
              ThemeData().colorScheme.copyWith(secondary: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const HomeScreen());
  }
}
