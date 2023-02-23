import 'package:first_app/animation_icons.dart';
import 'package:first_app/learn_flutter.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return AnimationIcons();
            }),
          );
        },
        child: Text("learn flutter"),
      ),
    );
  }
}
