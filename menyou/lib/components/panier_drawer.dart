import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:side_menu_animation/side_menu_animation.dart';

class PanierDrawer extends StatefulWidget {
  const PanierDrawer({Key? key}) : super(key: key);

  @override
  State<PanierDrawer> createState() => _PanierDrawerState();
}

class _PanierDrawerState extends State<PanierDrawer> {
  final _index = ValueNotifier<int>(1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideMenuAnimation.builder(
        builder: (showMenu) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: showMenu),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              brightness: Brightness.light,
              centerTitle: true,
              title: ValueListenableBuilder<int>(
                valueListenable: _index,
                builder: (_, value, __) => Text("EE", style: TextStyle(color: Colors.black)),
              ),
            ),
            body: ValueListenableBuilder<int>(
              valueListenable: _index,
              builder: (_, value, __) => IndexedStack(
                index: value - 1,
                //children: [YourCustomViews1Here(), YourCustomViews2Here()],
              ),
            ),
          );
        },
       items: [],
        selectedColor: Color(0xFFFF595E),
        unselectedColor: Color(0xFF1F2041),
        onItemSelected: (value) {
          if (value > 0 && value != _index.value) _index.value = value;
        }
      ),
    );
  }
}
