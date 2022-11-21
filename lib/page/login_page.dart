import 'package:crowdeyes_flutter_chatroom/model/Student.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final studentNameController = TextEditingController();
  final studentIdController = TextEditingController();
  String studentName = "";
  String studentId = "";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
              },
              child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 300,
                color: Colors.grey,
                child: const Text("Tap to upload image"),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("姓名：",style: TextStyle(fontSize: 28),),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: studentNameController,
                    onChanged: (text){
                      studentName = studentNameController.text;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Name'
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("學號：",style: TextStyle(fontSize: 28),),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: studentIdController,
                    onChanged: (text){
                      studentId = studentIdController.text;
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Student ID'
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            TextButton(
                onPressed: (){
                  if(studentName != "" && studentId != ""){
                    Student(studentName: studentName, studentId: studentId);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Message"),
                          content: const Text("Register Success"),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        )
                    );
                    studentNameController.clear();
                    studentIdController.clear();
                  }
                  else{
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Please fill out the form"),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text("OK"))
                          ],
                        )
                    );
                  }

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                        // side: const BorderSide(color: Colors.black)
                      )
                  ),
                ),
                child: const Text("註冊",style: TextStyle(
                    fontSize: 28,
                    color: Colors.white),
                )
            ),
            const SizedBox(height: 8,),
            TextButton(
                onPressed: (){
                },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    // side: const BorderSide(color: Colors.black)
                  )
                ),
              ),
                child: const Text("以訪客登入",style: TextStyle(
                    fontSize: 28,
                    color: Colors.white)
                ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Chatroom',
        child: const Icon(Icons.chat_bubble),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}