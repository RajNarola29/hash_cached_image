import 'package:flutter/material.dart';
import 'package:hash_cached_image/global_parameter.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

void main() {
  HashCachedImageGlobalParameter().setGlobalParameter(
    globalPlaceholderWidget: (context) {
      return const CircularProgressIndicator();
    },
    globalErrorWidget: (context, object, stackTrace) {
      return const Icon(Icons.error_rounded);
    },
  );
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
            imageUrl: "Image Url",
            hash: "Hash String",
          ),
        ),
      ),
    );
  }
}
