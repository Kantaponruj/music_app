import 'package:flutter/material.dart';
import 'package:music_app/providers/music_provider.dart';
import 'package:music_app/screens/home_page.dart';
import 'package:music_app/utils/theme/custom_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MusicProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customTheme(),
      home: const HomePage(),
    );
  }
}
