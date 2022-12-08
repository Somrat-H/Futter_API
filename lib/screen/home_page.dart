import 'package:api/screen/comment_page.dart';
import 'package:api/screen/gallery_sceen.dart';
import 'package:api/screen/home_screen.dart';
import 'package:api/screen/todo_screen.dart';
import 'package:api/screen/home_screen2.dart';
import 'package:api/screen/user_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("REST Api Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text("Post Model"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen2()),
                  );
                },
                child: const Text("Photos Model"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommentPage()),
                  );
                },
                child: const Text("Comment Model"),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  const ToDoScreen()),
                  );
                },
                child: const Text("Todo Model"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  const UserScreen()),
                  );
                },
                child: const Text("User Model"),
              ),
               ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  const GalleryScreen()),
                  );
                },
                child: const Text("Photo Collection"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}