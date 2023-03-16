
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:menyou/models/commande.dart';
import 'package:menyou/models/commande_items.dart';

Future<String> addCommande(Commande commande) async {
  await FirebaseFirestore.instance.collection("commandes").add({
    "reference":commande.reference,
    "clientId": commande.clientId,
    "prixTotal":commande.prixTotal,
    "date": commande.date
  }
  ).then((value) => commande.reference = value.id);
  return commande.reference;
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

Future<List<Commande>> getCammande(String clientID) async{
  List<Commande> commandes = [];
  await FirebaseFirestore.instance.collection("commandes").where("clientId",isEqualTo: clientID).get()
  .then((value) => value.docs.forEach((element) {
    final datee = element.data()['date'].toDate();
    final formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(datee);
    Commande commande = Commande(reference: element.data()['reference'], date:DateTime.parse(formattedDate), clientId: element.data()['clientId'], prixTotal: element.data()['prixTotal']);
    commandes.add(commande);
  }));
 return commandes;
}

Future<List<CommandeItems>> getCammandeItems(String idCommande) async{
  List<CommandeItems> commandesItems = [];
  await FirebaseFirestore.instance.collection("commandeItems").where("commande",isEqualTo: idCommande).get()
      .then((value) => value.docs.forEach((element) {
    CommandeItems commandeItem = CommandeItems(id: element.id, prix: element.data()['prix'], plat: element.data()['plat'].toString(), commande: element.data()['commande'], quantity: element.data()['quantity']);
    commandesItems.add(commandeItem);
  }));
  return commandesItems;
}