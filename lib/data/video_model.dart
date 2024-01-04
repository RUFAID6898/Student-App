// video_model.dart
import 'package:hive/hive.dart';

part 'video_model.g.dart';

@HiveType(typeId: 0)
class Video extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  Video({required this.name, required this.url});
}
