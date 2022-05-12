import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'joystick.dart';

void main() {
  runApp(const JoystickExampleApp());
}

class JoystickExampleApp extends StatelessWidget {
  const JoystickExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Joystick Example'),
        ),
        body: const JoystickExample(),
      ),
    );
  }
}
