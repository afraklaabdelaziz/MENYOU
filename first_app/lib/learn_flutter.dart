import 'package:flutter/material.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({Key? key}) : super(key: key);

  @override
  State<LearnFlutter> createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('learn flutter'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/abc.jpg"),
          SizedBox(
            height: 20,
          ),

          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.blueGrey,
            width: double.infinity,
            child: Center(
              child: Text("text"),
            ),
          ),
        ],
      ),
    );
  }
}
