import 'dart:convert';


import 'package:api/Models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {


  List<UserModel> userList = [];
  Future<List<UserModel>> getUser() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: const Text("Api Practice"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUser(),
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return const Text('Loading...', 
                   
                   style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    
                   ),
                  );
                }
                else {
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Column(
                        children: [
                          ReuseAbleRow(title: 'Name', value: snapshot.data![index].name.toString()),
                          ReuseAbleRow(title: 'Email', value: snapshot.data![index].email.toString()),
                          ReuseAbleRow(title: 'Address', value: snapshot.data![index].address!.city.toString()),
                          ReuseAbleRow(title: 'Geo', value: snapshot.data![index].address!.geo!.lat.toString()),
                        ],
                      ),
                    );
                  }
                  );
              }
            }),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReuseAbleRow extends StatelessWidget {
  String title, value;
  ReuseAbleRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            Text(title),
            Text(value),
      ],
    );
  }
}