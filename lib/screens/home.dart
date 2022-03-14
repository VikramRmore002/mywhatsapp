import 'package:flutter/material.dart';
import '../screens/callscr.dart';
import '../screens/statusscr.dart';
import '../screens/chatsscr.dart';
import '../screens/camera.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController ;
 
  @override
  void initState() {
    super.initState();
    _tabController= TabController(initialIndex: 1,length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp",style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
       IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
       IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          // isScrollable: true,
          indicatorWeight: 3.0,

          tabs: const [
            Tab( icon: Icon(Icons.camera_alt),),
            Tab( child: Text("CHATS",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),),
            Tab( child: Text("STATUS",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),),
            Tab( child: Text("CALLS",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),)
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Camera(),
          Chats(),
          Status(),
          Calls()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: (){},
        child: const Icon(Icons.message),
      ),

    );
  }
}
