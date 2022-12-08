import 'dart:convert';

import 'package:api/Models/galleryModel.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<GalleryModel> galleryList = [];

  Future<List<GalleryModel>> getGallery() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        galleryList.add(GalleryModel.fromJson(i));
      }
      return galleryList;
    } else {
      return galleryList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpaper'),
      ),
      body: Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: getGallery(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // Text(galleryList[index].title.toString()),
                                // SizedBox(height: 20,),
                                Image.network(galleryList[index].url.toString()),
                              ],
                            ),
                          ),
                        );
                      }));
                } else {
                  return const Text('Loading....');
                }
              }),
        )
      ],
    ),
    );
    
    
  }
}
