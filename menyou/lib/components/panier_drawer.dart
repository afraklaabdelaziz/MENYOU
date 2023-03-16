import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';
import '../models/commande.dart';
import '../models/commande_items.dart';
import '../services/commande_service.dart';


class PanierDrawer extends StatefulWidget {
  PanierDrawer({super.key});

  @override
  State<PanierDrawer> createState() => _PanierDrawerState();
}

class _PanierDrawerState extends State<PanierDrawer> {


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
    return Drawer(
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        width: 100.0,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 60, 5, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              Container(
                  height: 420,
                  width: 80,
                  child: ListView.builder(
                      itemCount: panier.length,
                      itemBuilder: (BuildContext context, index) {
                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image(
                                  image: AssetImage(
                                      panier[index].image),
                                  height: 80.0,
                                  width: 80.0,
                                  fit: BoxFit.cover, //change image fill type
                                ),
                              ),
                            ),
                            Positioned(
                                top: -15,
                                right: -10,
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      panier.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete,color: Colors.red,),
                                ))
                          ],
                        );
                      })),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Container(
                child: Column(
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10.00)),
                    Text(
                      panier.length.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10.00)),
                    Text(
                      prixTotal.toString() + " \$",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 20.00)),
                    ElevatedButton(
                        onPressed: () {
                          Commande commande = Commande(reference: "dddddd", date: DateTime.now(), clientId: "client1", prixTotal: prixTotal);
                          addCommande(commande);
                          panier.forEach((element) {
                            CommandeItems commandeItem = CommandeItems(prix: element.prix, plat: element.id, commande: commande.reference, id: 'zzz',quantity: element.quantity);
                            addCommandeItem(commandeItem);
                          });
                          sendNotification(prixTotal);
                          panier.clear();
                        },
                        child: Icon(Icons.check)),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
