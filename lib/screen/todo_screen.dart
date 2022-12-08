import 'dart:convert';


import 'package:api/Models/todoMode.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {

  List<todoModel> todoList = [];

  Future<List<todoModel>> getTodo() async{
    final response = await http.get(Uri.parse("https://webhook.site/e9021f9f-7a9c-4b29-89fa-fa7717818cd2"));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        todoList.add(todoModel.fromJson(i));
      }
      return todoList;
    }
    else{
      return todoList;
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
              future: getTodo(),
              builder: (context, snapshot){
              if(!snapshot.hasData){
                return const Text("Loading...");
              }
              else{
               return ListView.builder(
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
                              Text('ID: ${todoList[index].id}'),
                              Text('Title: ${todoList[index].title}'),
                              Text('Completed or Not: ${todoList[index].completed}'),
                            ],
                          ),
                        ),
                      ),
                    );
                });
              }
            }),
          )
      ]),
    );
  }
}