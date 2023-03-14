
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menyou/models/commande.dart';

Future<Commande> addCaommande(Commande commande) async {
  await FirebaseFirestore.instance.collection("commandes").add({
    "clientId": commande.clientId,
     "plats" : {
     },
    "prixTotal":commande.prixTotal,
    "date": commande.date
  }
  ).then((value) => print(value.id));
  return commande;
}