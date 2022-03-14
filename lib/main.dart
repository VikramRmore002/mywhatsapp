import 'package:flutter/material.dart';
import 'screens/home.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor : Colors.green.shade700,
      primaryColor: Colors.teal.shade700,
       tabBarTheme: const TabBarTheme(
         labelColor: Colors.white,
       ),
        textTheme: const TextTheme(
          headline6: TextStyle( color: Colors.white, fontSize: 16.0),
          bodyText2: TextStyle( color: Colors.black ),
          button: TextStyle( color: Colors.white )  ,
        ),
        bottomAppBarColor: Colors.white
      ),
      home: Home(),
    );
  }
}
