import 'package:crowdeyes_flutter_chatroom/model/Student.dart';
import 'package:flutter/material.dart';

import '../model/Message.dart';

class ChatroomPage extends StatefulWidget {
  const ChatroomPage({super.key});

  @override
  State<ChatroomPage> createState() => _ChatroomPageState();
}

class _ChatroomPageState extends State<ChatroomPage> {

  final messageController = TextEditingController();

  List<String> chatHistoryList = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: BottomAppBar(
          color: Colors.blue,
          elevation: 0,
          child: messageBar(),
        ),
        body: chatHistory(),
    );
  }

  Widget chatHistory(){
    return StreamBuilder(
        // stream: _,
        builder: (context, snapshot){
      return Container();
    });
  }

  Widget messageBar(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 8,),
        Expanded(
          child: TextField(
            controller: messageController,
          onChanged: (text){
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Message...'
            ),
          ),
        ),
        SizedBox(width: 8,),
        IconButton(
          icon: Icon(Icons.send),
          tooltip: 'Send',
          onPressed: (){
            Message message = Message(content: messageController.text);
            print(message.content);
            messageController.clear();
          },
        ),
      ],
    );
  }
}