import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
import 'package:menyou/main.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    if (panier.length == 0) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 300),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Panier Vide",
                  style: TextStyle(fontSize: 30,color: Colors.black87),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return Home();
                }),);
              }, child: Text("List Produits"),)
            ],
          ),
        ),
      );
    }else {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: panier.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange[300],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.only(top: 40),
                                  ),
                                  Align(
                                    child: Image.asset(panier[index]["image"]),
                                  )
                                ],
                              )),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 60, bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          panier[index]["name"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              panier.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      panier[index]["prix"].toString() + "\$",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      panier[index]["quantity"].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  }
              ),
          ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(0.9),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('commander'),
          ),
        ),
      );
    }
  }
}
