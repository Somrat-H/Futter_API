import 'dart:convert';

import 'package:api/Models/photosModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  
  List<PhotosModel> photsList = [];
  Future<List<PhotosModel>> getPhotos() async {
    final reponse = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(reponse.body.toString());

    if (reponse.statusCode == 200) {
      for (Map i in data) {
        PhotosModel photosModel =
            PhotosModel(title: i['title'], url: i['url'], id: i['id']);
        photsList.add(photosModel);
      }
      return photsList;
    } else {
      return photsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Practice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Text("Loading");
                    } else {
                      return ListView.builder(
                          itemCount: photsList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString()),
                              ),
                              subtitle:
                                  Text(snapshot.data![index].title.toString()),
                              title: Text(snapshot.data![index].id.toString()),
                            );
                          });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
