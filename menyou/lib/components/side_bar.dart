import 'package:flutter/material.dart';
import 'package:menyou/components/info_card.dart';
import 'package:rive/rive.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 300,
      height: double.infinity,
      color: Colors.amber,
      child: SafeArea(
        child: Column(
          children: const [
            InfoCard(),
            Padding(
              padding: EdgeInsets.only(left: 24,top: 32,bottom: 16),
              child: Text(
                "Browser",
                style: TextStyle(color: Colors.white38),
              ),
            ),
            SideMenu()
          ],
        ),
      ),
    ));
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(
          color: Colors.black,
          height: 1,
        ),
        ListTile(
          leading: SizedBox(
              width: 30,
              height: 22,
              child: RiveAnimation.asset(
                "assets/rive/rive_icons.riv",
                artboard: "HOME",
              )),
          title: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
