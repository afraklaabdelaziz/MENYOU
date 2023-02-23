import 'package:first_app/cards.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 288,
      height: double.infinity,
      color: Color(0xFF17203A),
      child: SafeArea(
        child: Column(
          children: const [
           Cards(name: "afrakla"),
            ListTile(
              leading: SizedBox(
                width: 35,
                height: 35,
              ),
            )
          ],

        ),
      ),
    ));
  }
}
