import 'package:flutter/material.dart';
import 'package:student_video_app/data/video_model.dart';
import 'package:student_video_app/local_store/local_store.dart';

class TeacherScreen extends StatelessWidget {
  final TextEditingController videoNameController = TextEditingController();
  final TextEditingController videoUrlController = TextEditingController();

  TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: videoNameController,
              decoration: const InputDecoration(labelText: 'Enter Video Name'),
            ),
            TextField(
              controller: videoUrlController,
              decoration: const InputDecoration(labelText: 'Enter Video URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String videoName = videoNameController.text.trim();
                String videoUrl = videoUrlController.text.trim();
                if (videoName.isNotEmpty && videoUrl.isNotEmpty) {
                  Video video = Video(name: videoName, url: videoUrl);
                  await LocalStorage.saveVideo(video);
                  videoNameController.clear();
                  videoUrlController.clear();
                }
              },
              child: const Text('Send Video Link'),
            ),
          ],
        ),
      ),
    );
  }
}
