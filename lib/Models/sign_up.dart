import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, String password) async{
   try{
      Response response = await post(Uri.parse('https://reqres.in/api/register'),
      
      body: {
        'email' : email,
        'password' : password,
      }
      
      );

      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data['id']);
        print('SignUp Successfully');
        
      }
      else{
        print('Unsuccess');
      }
   }catch(e){
    print(e.toString());
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),
            TextFormField(
              controller: emailController,
             decoration: const InputDecoration(
              hintText: 'Email',
             ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
              hintText: 'Password',
             ),  
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
            onPressed: (){
              setState(() {
                login(emailController.text.toString(), passwordController.text.toString());  
              });
                      },
             child: const Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}

