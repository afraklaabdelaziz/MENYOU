class Plat {
  String id;
  String nom;
  num prix;
  String description;
  num note;
  String categorie;
  String image;
  String restaurant;
  int quantity = 1;

  Plat({
    required this.id,
    required this.nom,
    required this.prix,
    required this.description,
    required this.note,
    required this.categorie,
    required this.image,
    required this.restaurant
  });
  factory Plat.fromJson(Map<dynamic, dynamic> json) {
    return Plat(
      id: json['id'],
      note:json['etoile'],
      nom: json['nom'],
      prix: json['prix'],
      description: json['description'],
      categorie: json['categorie'],
      image: json['image'],
      restaurant: json['restaurant']
    );
  }
}