import 'package:flutter/material.dart';
import 'package:student_video_app/screens/student_screen.dart';
import 'package:student_video_app/screens/teacher_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _usernameCotroller = TextEditingController();
  final TextEditingController _passwordCotroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const Text(
              'Login Page',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _usernameCotroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter User Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordCotroller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter password'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherScreen(),
                      ));
                },
                child: Text('Login Teachers')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentScreen(),
                      ));
                },
                child: const Text('Login Student')),
          ],
        ),
      ),
    );
  }
}
