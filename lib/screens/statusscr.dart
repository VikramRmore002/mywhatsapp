import 'package:flutter/material.dart';
import '../Model/wcard.dart';
import '../Model/chats.dart';
class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
          Wcard("my Status", "tap to add Status", "https://firebasestorage.googleapis.com/v0/b/flutterfirstproject-29916.appspot.com/o/scaled_image_picker7069477361317454028.jpg?alt=media&token=ae62e96b-ccbf-486a-b92c-41c7edd37ef6")
      
      ,Divider(),
      Hedding("Recent Updated"),
        Divider(),
        Wcard(Message[1].name, Message[1].time, Message[1].photourl),
        Wcard(Message[2].name, Message[2].time, Message[2].photourl),
        Wcard(Message[3].name, Message[3].time, Message[3].photourl),
        Hedding("Recent Viewed"),
        Divider(),
        Wcard(Message[4].name, Message[4].time, Message[4].photourl),
        Wcard(Message[6].name, Message[6].time, Message[6].photourl),
        Wcard(Message[7].name, Message[7].time, Message[7].photourl),

      ],
    );
  }

}
class Hedding extends StatelessWidget {
   late String hedding;
  Hedding( this.hedding,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(hedding),
    );
  }
}

