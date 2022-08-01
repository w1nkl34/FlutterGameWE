import 'package:dashbook/dashbook.dart';
import 'package:fluttergamewe/commons/commons.dart';
import 'package:fluttergamewe/stories/bridge_libraries/audio/basic_audio_example.dart';
import 'package:flame/game.dart';

void addAudioStories(Dashbook dashbook) {
  dashbook.storiesOf('Audio').add(
        'Basic Audio',
        (_) => GameWidget(game: BasicAudioExample()),
        codeLink: baseLink('audio/basic_audio_example.dart'),
        info: BasicAudioExample.description,
      );
}
