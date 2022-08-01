import 'package:dashbook/dashbook.dart';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flame_rive/flame_rive.dart';
import 'advanced_joystick.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              GameWidget(
                game: JoystickAdvancedExample(
                  viewportResolution: Vector2(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (context) => const PushS()));
                  },
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}

class PushS extends StatefulWidget {
  const PushS({super.key});

  @override
  State<PushS> createState() => PushState();
}

class PushState extends State<PushS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, i) {
              return Text(i.toString());
            },
          ),
        ),
      ),
    );
  }
}
