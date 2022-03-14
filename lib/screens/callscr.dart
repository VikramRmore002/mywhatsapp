import 'package:flutter/material.dart';
import '../Model/calls.dart';
class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Calllog.length,
        itemBuilder: (context , i){
          return Column(
            children: [
              Divider(height: 20.0,),
              ListTile(
                leading:CircleAvatar(
                  backgroundImage: NetworkImage(Calllog[i].photourl),
                  maxRadius: 25,
                ),

                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Calllog[i].name,style: const TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold)),

                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(Calllog[i].time,style: const TextStyle(color: Colors.grey,fontSize: 16.0)),
                ),
                onTap: (){},
                trailing: IconButton(icon: Icon(Icons.call), onPressed: () { },),
               selected: true,

              ),
            ],

          );
        });

  }
}
