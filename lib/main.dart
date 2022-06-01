import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/fruits_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.light),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const FruitsScreen(),
    );
  }
}
