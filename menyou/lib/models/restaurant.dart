class Restaurant {
  String id;
  String nom;
  String ville;
  String image;
  String adresse;

  Restaurant({required this.id,required this.nom,required this.ville,required this.image,required this.adresse});
  factory Restaurant.fromJson(Map<dynamic, dynamic> json) {
    return Restaurant(
        id: json['id'],
        ville:json['ville'],
        nom: json['nom'],
        image: json['image'],
        adresse: json['adresse']
    );
  }
}