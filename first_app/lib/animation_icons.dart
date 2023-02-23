import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AnimationIcons extends StatelessWidget {
  const AnimationIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey2
        ),
        child: Row(

        ) ,
      ),
    );
  }
}
