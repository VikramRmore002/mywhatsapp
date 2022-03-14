import 'package:flutter/material.dart';
import '../Model/chats.dart';
import 'chatdetails.dart';
class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: Message.length,
        itemBuilder: (context , i){
         return Column(
           children: [
             Divider(height: 20.0,),
             ListTile(
               leading:CircleAvatar(
                 backgroundImage: NetworkImage(Message[i].photourl),
                 maxRadius: 25,
               ),

              title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(Message[i].name,style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                 Text(Message[i].time,style: const TextStyle(color: Colors.grey,fontSize: 13.0)),
               ],
             ),
               subtitle: Container(
                 padding: EdgeInsets.only(top: 5.0),
                 child: Text(Message[i].message,style: const TextStyle(fontSize: 16.0)),
               ),
               onTap: () {
                 var route = MaterialPageRoute(
                     builder: (BuildContext context) => ChatDetails(
                         name: Message[i].name,
                         profileImage: Message[i].photourl));
                 Navigator.of(context).push(route);
               },
             ),

           ],

         );
        });

  }
}
