class CommandeItems {
  String id;
  num prix;
  String plat;
  int quantity;
  String commande;

  CommandeItems({
    required this.id,
    required this.prix,
    required this.plat,
    required this.commande,
    required this.quantity
  });
  factory CommandeItems.fromJson(Map<dynamic, dynamic> json) {
    return CommandeItems(
        id: json['id'],
        prix: json['prix'],
        plat: json['plat'],
        commande: json['commande'],
        quantity: json['quantity']
    );
  }
}