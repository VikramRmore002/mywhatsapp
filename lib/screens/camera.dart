import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:async';



class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
 File? _image;
  @override
  Widget build(BuildContext context) {
    return  Column( children: [
      Center(
          child:Container( padding: EdgeInsets.all(20.0),
              height: 500,
              width: 500,
              child: _image != null ?Image.file(_image!):const Text('please select a  image',style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
      ),),
      Container(
        padding: EdgeInsets.all(20.0),
        alignment:Alignment.bottomCenter,
        child: FloatingActionButton(onPressed: _optionDialogBox,
          child: Icon(Icons.add_a_photo_outlined),
          tooltip: 'open a camera',),
      )
    ],);

  }

 Future <void> _optionDialogBox (){
   return showDialog(context: context,
       builder: (BuildContext context){
         return AlertDialog(
           elevation: 1.5,
           title:Text('make a choice'),
           backgroundColor: Colors.teal,
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 GestureDetector(
                   child: Text('open camera',
                       style : TextStyle(
                         fontSize: 20.0 ,
                         color: Colors.white,
                       )),
                   onTap: opencamera,
                 ),
                 Padding(padding: EdgeInsets.all(10.0)),
                 GestureDetector(
                   child: Text('select picture from gallery',
                       style : TextStyle(
                         fontSize: 20.0 ,
                         color: Colors.white,
                       )),
                   onTap: pickImage,
                 )
               ],
             ),
           ),
           shape: RoundedRectangleBorder(
         borderRadius : BorderRadius.circular(20.0)
           )

         );
       }

   );
 }


  ImagePicker imagePicker = ImagePicker();
  Future opencamera() async {
    final  image = await imagePicker.pickImage(source: ImageSource.camera,maxHeight: 500.0,maxWidth: 500.0);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      Navigator.pop(context);
    }else{
      print("no image selected ");
    }
  }
 Future pickImage() async {
   final  image = await imagePicker.pickImage(source: ImageSource.gallery,maxHeight: 500.0,maxWidth: 500.0);
   if (image != null) {
     setState(() {
       _image = File(image.path);
     });
     Navigator.pop(context);
   }else{
     print("no image selected ");
   }
 }
}
