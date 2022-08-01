import 'package:dashbook/dashbook.dart';
import 'package:fluttergamewe/commons/commons.dart';
import 'package:fluttergamewe/stories/system/overlays_example.dart';
import 'package:fluttergamewe/stories/system/pause_resume_example.dart';
import 'package:fluttergamewe/stories/system/without_flamegame_example.dart';
import 'package:flame/game.dart';

void addSystemStories(Dashbook dashbook) {
  dashbook.storiesOf('System')
    ..add(
      'Pause/resume engine',
      (_) => GameWidget(game: PauseResumeExample()),
      codeLink: baseLink('system/pause_resume_example.dart'),
      info: PauseResumeExample.description,
    )
    ..add(
      'Overlay',
      overlayBuilder,
      codeLink: baseLink('system/overlays_example.dart'),
      info: OverlaysExample.description,
    )
    ..add(
      'Without FlameGame',
      (_) => GameWidget(game: NoFlameGameExample()),
      codeLink: baseLink('system/without_flamegame_example.dart'),
      info: NoFlameGameExample.description,
    );
}
