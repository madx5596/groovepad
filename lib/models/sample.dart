import 'package:audioplayers/audioplayers.dart';

class Sample {
  final String id;
  final String name;
  final String path;
  bool isPlaying = false;

  Sample({
    required this.id,
    required this.name,
    required this.path,
  });
}

class SamplePlayer {
  static final SamplePlayer _instance = SamplePlayer._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  factory SamplePlayer() {
    return _instance;
  }

  SamplePlayer._internal();

  Future<void> play(String path) async {
    try {
      await _audioPlayer.play(DeviceFileSource(path));
    } catch (e) {
      print('Ошибка воспроизведения: $e');
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  void addListener(VoidCallback listener) {
    _audioPlayer.onPlayerStateChanged.listen((_) {
      listener();
    });
  }
}
