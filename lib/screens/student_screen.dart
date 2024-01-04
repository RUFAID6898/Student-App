import 'package:flutter/material.dart';

import 'package:student_video_app/data/video_model.dart';
import 'package:student_video_app/local_store/local_store.dart';
import 'package:student_video_app/video_screen/video_plyer_screen.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Screen'),
      ),
      body: FutureBuilder<List<Video>>(
        future: LocalStorage.getVideos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No videos available.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Video video = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(video.name),
                    trailing: CircleAvatar(
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoPlayerScreen(video: video),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow)),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
