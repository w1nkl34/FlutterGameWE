import 'package:dashbook/dashbook.dart';
import 'package:examples/stories/animations/animations.dart';
import 'package:examples/stories/bridge_libraries/audio/audio.dart';
import 'package:examples/stories/bridge_libraries/forge2d/flame_forge2d.dart';
import 'package:examples/stories/camera_and_viewport/camera_and_viewport.dart';
import 'package:examples/stories/collision_detection/collision_detection.dart';
import 'package:examples/stories/components/components.dart';
import 'package:examples/stories/effects/effects.dart';
import 'package:examples/stories/experimental/experimental.dart';
import 'package:examples/stories/games/games.dart';
import 'package:examples/stories/input/input.dart';
import 'package:examples/stories/input/joystick_player.dart';
import 'package:examples/stories/parallax/parallax.dart';
import 'package:examples/stories/rendering/rendering.dart';
import 'package:examples/stories/sprites/sprites.dart';
import 'package:examples/stories/svg/svg.dart';
import 'package:examples/stories/system/system.dart';
import 'package:examples/stories/utils/utils.dart';
import 'package:examples/stories/widgets/widgets.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flame_rive/flame_rive.dart';

import 'advanced_joystick.dart';

// void main() {
// final dashbook = Dashbook(
//   title: 'Flame Examples',
//   theme: ThemeData.dark(),
// );

// addGameStories(dashbook);
// addAudioStories(dashbook);
// addAnimationStories(dashbook);
// addCameraAndViewportStories(dashbook);
// addCollisionDetectionStories(dashbook);
// addComponentsStories(dashbook);
// addEffectsStories(dashbook);
// addExperimentalStories(dashbook);
// addInputStories(dashbook);
// addParallaxStories(dashbook);
// addRenderingStories(dashbook);
// addSpritesStories(dashbook);
// addSvgStories(dashbook);
// addSystemStories(dashbook);
// addUtilsStories(dashbook);
// addWidgetsStories(dashbook);
// addForge2DStories(dashbook);
// runApp(dashbook);
// }
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
