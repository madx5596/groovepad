import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../models/sample.dart';

class SampleProvider extends ChangeNotifier {
  final List<Sample?> samples = List.filled(16, null);
  final SamplePlayer _player = SamplePlayer();

  Future<void> loadSample(int cellIndex) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null) {
        final filePath = result.files.single.path!;
        final fileName = result.files.single.name;

        samples[cellIndex] = Sample(
          id: DateTime.now().toString(),
          name: fileName,
          path: filePath,
        );

        notifyListeners();
      }
    } catch (e) {
      print('Ошибка загрузки файла: $e');
    }
  }

  Future<void> playSample(int cellIndex) async {
    if (samples[cellIndex] != null) {
      await _player.play(samples[cellIndex]!.path);
    }
  }

  Future<void> stopSample() async {
    await _player.stop();
  }

  void removeSample(int cellIndex) {
    samples[cellIndex] = null;
    notifyListeners();
  }

  void clearAllSamples() {
    for (int i = 0; i < samples.length; i++) {
      samples[i] = null;
    }
    notifyListeners();
  }
}
