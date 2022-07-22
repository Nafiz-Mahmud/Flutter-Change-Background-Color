import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textController = TextEditingController();
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container(child: Center(child: userName.length > 0 ? Text('My Name is : $userName') : null))),
            TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: "Enter Your Name...",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: Icon(Icons.clear)))),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = _textController.text;
                  _textController.clear();
                });
              },
              child: Text("Post"),
            )
          ],
        ),
      ),
    );
    ;
  }
}
