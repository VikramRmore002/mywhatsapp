import 'package:flutter/material.dart';

import '../model/chats.dart';

class ChatDetails extends StatefulWidget {
  final String name;
  final String profileImage;
  const ChatDetails({required this.name, required this.profileImage});
  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool isType = false;

  void _handleSubmit(String text) {
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
          duration: Duration(seconds: 2), vsync: this),
      name: widget.name,
    );
    setState(() {
      _messages.insert(0, message);
      var data = Message.firstWhere((t) => t.name == widget.name);
      data.message = message.text;
    });
    message.animationController.forward();
  }

  Widget _buildText() {
    return Container(
      child:  Row(
        children: <Widget>[
      Container(
      child:  IconButton(
          icon:  const Icon(Icons.emoji_emotions_outlined),
        onPressed: () {})),
          Container(
            child: Flexible(
                child: TextField(
                  controller: _textController,
                  decoration:  const InputDecoration.collapsed(hintText: " message"),
                )),
          ),
           IconButton(
               icon:  const Icon(Icons.send),
               onPressed: () {
                 _handleSubmit(_textController.text);
                 _textController.clear();
               })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
        title: Container(
            child: Row(
              children: <Widget>[
                Container(
                  child:Expanded(child: Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.profileImage),
                        maxRadius: 18,
                      )),)
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          widget.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      const Text(
                        "last seen. 05:00",
                        style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              child: _buildText(),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String name;
  final AnimationController animationController;
  final String text;
  const ChatMessage({required this.name, required this.animationController, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1149022/pexels-photo-1149022.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                maxRadius: 20.0,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),
                  Container(
                      margin: const EdgeInsets.only(top: 6.0),
                      child: Text(text,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18.0)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
