import 'package:crowdeyes_flutter_chatroom/page/chatroom_page.dart';
import 'package:crowdeyes_flutter_chatroom/page/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Text("Register"),
              Text("Chatroom"),
              Text("Author"),
            ]),
            title: const Text("NCKU CrowdEyes"),
          ),
          body: const TabBarView(children: [
            LoginPage(),
            ChatroomPage(),
            Text("")
          ]),
        ),
      ),
    );
  }
}


