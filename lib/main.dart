import 'dart:io';

import 'package:dashbook/dashbook.dart';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flame_rive/flame_rive.dart';
import 'advanced_joystick.dart';

void main() {
  runApp(const MyApp());
  Flame.device.fullScreen();
  if (Platform.isIOS) {
    Flame.device.setPortraitDownOnly();
  }
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
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sevan'),
        ),
        body: Stack(
          children: [
            GameWidget(
              game: JoystickAdvancedExample(),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const PushS(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ],
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
      appBar: AppBar(
        title: const Text('My List'),
      ),
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
