import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
import 'package:menyou/models/commande.dart';
import 'package:menyou/services/commande_service.dart';
import 'package:uuid/uuid.dart';

import '../main.dart';
import '../models/commande_items.dart';

class Panier extends StatefulWidget {
  const Panier({Key? key}) : super(key: key);

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  double prixTotal = 0;
  void calculePrixTotal(){
    prixTotal = 0;
    panier.forEach((element) {
      prixTotal += element.prix * element.quantity.ceilToDouble();
      print(prixTotal);
    });
  }
  sendNotification(double prixTotal){
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'channelKey',
            title: 'commande est ajouter avec success',
            body: 'prix Total ' + prixTotal.toString()
        )
    );
  }

  @override
  void initState() {
    calculePrixTotal();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed){
      if(!isAllowed){
        AwesomeNotifications().requestPermissionToSendNotifications(

        );
      }
    });
    super.initState();
  }
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
                        child: Row(
                          children: [
                             Container(
                              alignment: Alignment.center,
                               margin: EdgeInsets.only(top: 60, bottom: 20),
                             child:Image.asset(panier[index].image,width: 150,height: 150,)
                             ),
                            Expanded(
                                child: Container(
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
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
                                    panier[index].nom,
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
                                              color: panier[index].quantity != 1
                                                  ? Colors.orange
                                                  : Colors.grey,
                                              weight: 2),
                                          onPressed: () {
                                            setState(() {
                                              panier[index].quantity--;
                                            });
                                            calculePrixTotal();
                                            if (panier[index].quantity <= 1) {
                                              panier[index].quantity = 1;
                                            }
                                          },
                                        ),
                                        Text(panier[index].quantity.toString()),
                                        IconButton(
                                          icon: Icon(Icons.add_circle,
                                              color: Colors.orange, weight: 2),
                                          onPressed: () {
                                            setState(() {
                                              panier[index].quantity++;
                                            });
                                            calculePrixTotal();
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
                       Commande commande = Commande(reference: Uuid().v4(), date: DateTime.now(), clientId: "client1", prixTotal: prixTotal);
                       addCommande(commande);
                       panier.forEach((element) {
                         CommandeItems commandeItem = CommandeItems(prix: element.prix, plat: element.id, commande: commande.reference, id: Uuid().v4(),quantity: element.quantity);
                         addCommandeItem(commandeItem);
                       });
                        sendNotification(prixTotal);
                       setState(() {
                         panier.clear();
                       });
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

              Positioned(
                right: 10,
                left: 10,
                top: 0,
                child: Container(
                    color: Colors.grey[200],
                      child: Text(
                        "prix total "+ prixTotal.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
            ],
          ),
        ),
      );
    }
  }
}
