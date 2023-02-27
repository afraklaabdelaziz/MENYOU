import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      child :Row(
        children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/afrakla.png"),
                ),
              )
        ],
      ),
    );
  }
}
