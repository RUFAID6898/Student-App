import 'package:hive/hive.dart';
import 'package:student_video_app/data/video_model.dart';

class LocalStorage {
  static const String boxName = 'videos';

  static Future<void> saveVideo(Video video) async {
    final box = await Hive.openBox<Video>(boxName);
    box.add(video);
  }

  static Future<List<Video>> getVideos() async {
    final box = await Hive.openBox<Video>(boxName);
    return box.values.toList();
  }
}
