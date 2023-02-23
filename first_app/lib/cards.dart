import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({Key? key, required this.name}) : super(key: key);
 final String name;
  @override
  Widget build(BuildContext context) {
             return  ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    name,
                    style: TextStyle(color: Colors.white),
                  ),
             );
  }
}

