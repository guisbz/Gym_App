import 'package:chat_app/main.dart';
import 'package:flutter/material.dart';

class TelaDeLogin extends StatelessWidget {
  const TelaDeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 238, 168, 63),
        ),
      ),
      home: const Login(),
    );
  }
}
