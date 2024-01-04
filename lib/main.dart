import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_video_app/data/video_model.dart';
import 'package:student_video_app/login_page/login_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(VideoAdapter());
  await Hive.openBox<Video>('videos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage());
  }
}
