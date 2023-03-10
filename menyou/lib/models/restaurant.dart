class Restaurant {
  String nom;
  String ville;

  Restaurant({required this.nom,required this.ville});
  factory Restaurant.fromJson(Map<dynamic, dynamic> json) {
    return Restaurant(
        ville:json['ville'],
        nom: json['nom'],
    );
  }
}