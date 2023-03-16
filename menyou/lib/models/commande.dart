import 'package:menyou/models/plat.dart';

class Commande {
  String reference;
  DateTime date;
  String clientId;
  num prixTotal;

  Commande({required this.reference, required this.date,required this.clientId,required this.prixTotal});
  factory Commande.fromJson(Map<dynamic, dynamic> json) {
    return Commande(
       reference:json['reference'],
        date: json['date'],
        clientId: json['clientId'],
        prixTotal: json['prixTotal'],
    );
  }
}