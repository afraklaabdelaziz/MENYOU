import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
import 'package:menyou/models/commande.dart';
import 'package:menyou/models/plat.dart';
import 'package:menyou/services/commande_service.dart';

import '../main.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    if (panier.length == 0) {
      return Container(
        child: Expanded(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Panier Vide",
                  style: TextStyle(fontSize: 30, color: Colors.black87),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Home();
                    }),
                  );
                },
                child: Text("List Produits"),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,bottom: 40),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: panier.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 240,
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
                                  child: Image.asset(panier[index].image),
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        panier[index].nom,
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
                                    panier[index].prix.toString() + "\$",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    panier[index].nom.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        IconButton(
                                          icon: Icon(Icons.remove_circle,
                                              color: quantity != 1
                                                  ? Colors.orange
                                                  : Colors.grey,
                                              weight: 2),
                                          onPressed: () {
                                            setState(() {
                                              quantity--;
                                            });
                                            if (quantity <= 1) {
                                              quantity = 1;
                                            }
                                          },
                                        ),
                                        Text(quantity.toString()),
                                        IconButton(
                                          icon: Icon(Icons.add_circle,
                                              color: Colors.orange, weight: 2),
                                          onPressed: () {
                                            setState(() {
                                              quantity++;
                                            });
                                          },
                                        ),
                                      ])),
                                ],
                              ),
                            ))
                          ],
                        ),
                      );
                    }),
              ),
              Positioned(
                right: 10,
                left: 10,
                bottom: 0,
                child: Container(
                    color: Colors.grey[200],
                    child: ElevatedButton(
                      onPressed: () {
                       Commande commande = Commande(reference: "dddddd", date: DateTime.now(), clientId: "client1", plats:panier , prixTotal: 23);
                        addCaommande(commande);
                      },
                      child: Text(
                        "commander",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      );
    }
  }
}
