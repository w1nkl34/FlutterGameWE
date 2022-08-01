import 'package:dashbook/dashbook.dart';

import 'package:flame/game.dart';
import 'package:fluttergamewe/commons/commons.dart';
import 'package:fluttergamewe/stories/svg/svg_component.dart';

void addSvgStories(Dashbook dashbook) {
  dashbook.storiesOf('Svg').add(
        'Svg Component',
        (_) => GameWidget(game: SvgComponentExample()),
        codeLink: baseLink('svg/svg_component.dart'),
        info: SvgComponentExample.description,
      );
}
