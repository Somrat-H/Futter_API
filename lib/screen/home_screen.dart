// ignore_for_file: unused_local_variable

import 'dart:convert';


import 'package:api/Models/postModels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // no array name json, so make and parse the array to add data to our array.
  // fetch the data and show it
  List<Model1> postlist = []; 

  Future<List<Model1>> getPostApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
        
        for(Map i in data){
          postlist.add(Model1.fromJson(i));
        }
        return postlist;
        
    }else{
      return postlist;
    }
   
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Practice',),
      ),
      body: Column(
        children: [
           Expanded(
             child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return const Text("Loading");
                }
                else{
                  return ListView.builder(
                    itemCount: postlist.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                const Text('Tittle',
                                 style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                 ),
                                 ),
                                Text(postlist[index].title.toString()),
                                const SizedBox(height: 20,),
                                const Text('Description',
                                 style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                 ),
                                 ),
                                Text(postlist[index].body.toString()),
                            ],
                          ),
                        ),
                      );
                    }
                    );
                }
              }
              ),
           )
        ],
      ),
    );
  }
}