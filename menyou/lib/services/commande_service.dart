
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menyou/models/commande.dart';
import 'package:menyou/models/commande_items.dart';

Future<Commande> addCommande(Commande commande) async {
  await FirebaseFirestore.instance.collection("commandes").add({
    "clientId": commande.clientId,
    "prixTotal":commande.prixTotal,
    "date": commande.date
  }
  ).then((value) => commande.reference = value.id);
  return commande;
}

Future<CommandeItems> addCommandeItem(CommandeItems commandeItem) async {
  await FirebaseFirestore.instance.collection("commandeItems").add({
    "prix": commandeItem.prix,
    "quantity":commandeItem.quantity,
    "plat": commandeItem.plat,
    "commande":commandeItem.commande
  }
  ).then((value) => print(value.id));
  return commandeItem;
}