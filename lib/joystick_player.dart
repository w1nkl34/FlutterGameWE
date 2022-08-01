import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';

class JoystickPlayer extends RiveComponent with HasGameRef, CollisionCallbacks {
  double maxSpeed = 300.0;
  late final Transform2D _lastTransform = transform.clone();
  late final TextComponent positionText;
  static final TextPaint textRenderer = TextPaint(
    style: const TextStyle(color: Colors.white70, fontSize: 12),
  );
  final JoystickComponent joystick;
  SMIInput<bool>? _levelInput;

  JoystickPlayer(this.joystick, Artboard artboard)
      : super(
          artboard: artboard,
          size: Vector2.all(200),
        );

  @override
  Future<void> onLoad() async {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'State',
    );

    if (controller != null) {
      artboard.addController(controller);
      _levelInput = controller.findInput<bool>('Idle');
      _levelInput?.value = true;
    }
    // size = Vector2.all(300);
    // anchor = Anchor.center;
    // scale = Vector2.all(5000);
    position = Vector2(0, 0);
    anchor = Anchor.center;
    // add(RectangleHitbox());
    positionText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 + 80,
      anchor: Anchor.center,
    );

    add(positionText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!joystick.delta.isZero() && activeCollisions.isEmpty) {
      _lastTransform.setFrom(transform);
      position.add(joystick.relativeDelta * maxSpeed * dt);
    }
    positionText.text = '(${x.toInt()}, ${y.toInt()})';
  }

  @override
  void onCollisionStart(Set<Vector2> _, PositionComponent __) {
    super.onCollisionStart(_, __);
    transform.setFrom(_lastTransform);
  }

  @override
  void onCollisionEnd(PositionComponent __) {
    super.onCollisionEnd(__);
  }
}
