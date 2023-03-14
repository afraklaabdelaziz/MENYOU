import 'package:menyou/models/plat.dart';

class Commande {
  String reference;
  DateTime date;
  String clientId;
  List<Plat> plats;
  num prixTotal;

  Commande({required this.reference, required this.date,required this.clientId,required this.plats,required this.prixTotal});
  factory Commande.fromJson(Map<dynamic, dynamic> json) {
    List<dynamic> platsJson = json['plats'];
    List<Plat> plats = platsJson.map((platJson) => Plat.fromJson(platJson)).toList();
    return Commande(
       reference:json['reference'],
        date: json['date'],
        clientId: json['clientId'],
        prixTotal: json['prixTotal'],
        plats: plats
    );
  }
}