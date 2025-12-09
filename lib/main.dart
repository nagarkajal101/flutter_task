import 'package:flutter/material.dart';
import 'package:task2/view/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostsScreen(),
    );
  }
}