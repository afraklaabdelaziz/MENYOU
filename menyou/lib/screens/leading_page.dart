import 'package:flutter/material.dart';
import 'package:menyou/main.dart';
import 'package:rive/rive.dart';

class LeadingPage extends StatelessWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RiveAnimation.asset("assets/rive/food.riv"),
            Container(
              child: Text(
                "Toutes les plas ici",
                style: TextStyle(color: Colors.red[400], fontSize: 20),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Bien Venu chez nous",
                    style: TextStyle(color: Colors.black87, fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Restaurant Afrakla",
                    style: TextStyle(color: Colors.red[400], fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red[400]),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Home();
                        },
                      ),
                    );
                  },
                  child: Text("Démarrer",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            )
          ],
        ),
      ),
    );
  }
}
