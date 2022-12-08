import 'dart:convert';

import 'package:api/Models/commentModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  // here json array don't have name, so we parse the json array and made our own array then store the this array and
  // fetch the data and show it.
  List<CommentModel> commentList = [];
  Future<List<CommentModel>> getComment() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        CommentModel commentModel = CommentModel(name: i['name'], email: i['email'], body: i['body']);
        commentList.add(commentModel);
      }
      return commentList;
    }else{
      return commentList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Practice'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getComment(),
              builder: (context, snapshot){
                if (!snapshot.hasData) {
                      return const Text("Loading");
                    }
                    else{
                      return ListView.builder(
                        itemCount: commentList.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text('Name: ${snapshot.data![index].name}'),
                                    const SizedBox(height: 20,),
                                    Text('Email: ${snapshot.data![index].email}'),
                                    const SizedBox(height: 20,),
                                    Text('Body: ${snapshot.data![index].body}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                      });
                    }
              }
              ))
        ],
      ),
    );
  }
}