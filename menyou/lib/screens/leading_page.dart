import 'package:flutter/material.dart';
import 'package:menyou/main.dart';

class LeadingPage extends StatelessWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/food (2).png",height: 500,),

                  Text(
                    "Bien Venu chez nous",
                    style: TextStyle(color: Colors.black87, fontSize: 30,fontWeight: FontWeight.bold),
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
