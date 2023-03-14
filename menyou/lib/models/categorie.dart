class Categorie {
  String id;
  String nom;
  String image;

  Categorie({required this.id,required this.nom,required this.image});

  factory Categorie.fromJson(Map<dynamic, dynamic> json) {
    return Categorie(
        id:json['id'],
        nom: json['nom'],
        image: json['image'],
    );
  }
}