
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  File? image;
  final _picker = ImagePicker();
  bool spinner = false;

  Future getImage() async{
    final pikcedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if(pikcedFile!= null){
      image = File(pikcedFile.path);
      setState(() {
        
      });
    }else{
      print('no picked');
    }
  }
  @override
  Widget build(BuildContext context) {
    var absolute;
    var path;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Upload Image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         GestureDetector(
          onTap: (){
            getImage();
          },
           child: Container( 
            child : image == null ? const Center(child: Text('Pick Image'),) :
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Image.file(
                   File(image!.path).absolute,
                   height: 600,
                   width: 300,
                   fit: BoxFit.cover,
                 ),
               ),
             )),
         ),
        
        ],
      ),
    );
  }
}