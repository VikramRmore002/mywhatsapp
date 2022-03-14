import 'package:flutter/material.dart';

class Wcard extends StatelessWidget {
  final String name,time ,photourl;
  const Wcard( this.name,this.time,this.photourl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 25,
        foregroundColor: Colors.deepPurple,
        backgroundImage: NetworkImage(photourl),
      ),
      title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(time,style: TextStyle( fontSize: 15.0),),
    );
  }
}
