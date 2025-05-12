import 'package:demo_project/data/constants.dart';
import 'package:demo_project/data/notifier.dart';
import 'package:demo_project/views/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyHomePage());
}

String title = 'Flutter Mapp';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState()  {
    themeMode();
    super.initState();
  }

  void themeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkModeNotifier.value = prefs.getBool(KConstants.isDarkMode) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: isDarkModeNotifier, builder: (context, isDarkMode, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: isDarkMode ? Brightness.dark : Brightness.light,
          ),
        ),
        home: WelcomePage(),
      );
    },);
  }
}

