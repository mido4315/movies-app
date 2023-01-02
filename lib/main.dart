import 'package:flutter/material.dart';
import 'UI/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            color: Colors.grey,
                fontSize: 16,
          )
        )
      ),
      home: const HomePage(),
    );
  }
}
