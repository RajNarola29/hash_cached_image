import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: Center(
        child: HashCachedImage(
            imageUrl: "your image url", hash: "your hash", fit: BoxFit.fill),
      )),
    );
  }
}
