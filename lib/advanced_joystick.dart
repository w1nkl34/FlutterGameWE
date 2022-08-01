import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/particles.dart';
import 'package:flame/sprite.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'joystick_player.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

class JoystickAdvancedExample extends FlameGame
    with HasDraggables, HasTappables, HasCollisionDetection {
  late final JoystickPlayer player;
  late final JoystickComponent joystick;
  late final TextComponent speedText;
  late final Artboard artC;
  late final TextComponent directionText;
  // late final RiveComponent riveCom;

  @override
  Future<void> onLoad() async {
    final image = await images.load('joystick.png');
    final sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 6,
      rows: 1,
    );
    add(ScreenHitbox());
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: sheet.getSpriteById(1),
        size: Vector2.all(100),
      ),
      background: SpriteComponent(
        sprite: sheet.getSpriteById(0),
        size: Vector2.all(150),
      ),
      margin: const EdgeInsets.only(left: 130, bottom: 40),
    );

    final skillsArtboard =
        await loadArtboard(RiveFile.asset('assets/characters/lastRiv.riv'));
    player = JoystickPlayer(joystick, skillsArtboard);

    for (var i = 0; i < 30; i++) {
      add(Rock(Vector2(Map.genCoord(), Map.genCoord())));
    }
    add(Map());
    add(player);
    // add(ParticleDestroy(position: Vector2(50, 50)));
    add(joystick);
    camera.speed = 1;
    camera.followComponent(player, worldBounds: Map.bounds);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}

class Map extends Component {
  static const double size = 1500;
  static const Rect bounds = Rect.fromLTWH(-size, -size, 2 * size, 2 * size);

  static final Paint _paintBorder = Paint()
    ..color = Colors.white12
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  static final Paint _paintBg = Paint()..color = const Color(0xFF333333);

  static final _rng = Random();

  late final List<Paint> _paintPool;
  late final List<Rect> _rectPool;

  Map() : super(priority: 0) {
    _paintPool = List<Paint>.generate(
      (size / 50).ceil(),
      (_) => PaintExtension.random(rng: _rng)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
      growable: false,
    );
    _rectPool = List<Rect>.generate(
      (size / 50).ceil(),
      (i) => Rect.fromCircle(center: Offset.zero, radius: size - i * 50),
      growable: false,
    );
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(bounds, _paintBg);
    canvas.drawRect(bounds, _paintBorder);
    for (var i = 0; i < (size / 50).ceil(); i++) {
      canvas.drawCircle(Offset.zero, size - i * 50, _paintPool[i]);
      canvas.drawRect(_rectPool[i], _paintBorder);
    }
  }

  static double genCoord() {
    return -size + _rng.nextDouble() * (2 * size);
  }
}

class Rock extends SpriteComponent with HasGameRef, Tappable {
  Rock(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(50),
          priority: 1,
        );

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('nine-box.png');
    paint = Paint()..color = Colors.white;
    add(RectangleHitbox());
  }
}

class ParticleDestroy extends Component with HasGameRef {
  ParticleDestroy({
    required this.position,
  });
  Random rnd = Random();

  Vector2 randomVector2() => (Vector2.random(rnd) - Vector2.random(rnd)) * 50;
  Vector2 position;
  @override
  Future<void> onLoad() async {
    add(
      ParticleSystemComponent(
        position: position,
        particle: Particle.generate(
          count: 100,
          lifespan: 50,
          generator: (i) => AcceleratedParticle(
            acceleration: randomVector2(),
            child: CircleParticle(
              radius: 5.0,
              paint: Paint()..color = Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
