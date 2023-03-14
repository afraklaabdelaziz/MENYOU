import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menyou/models/plat.dart';


Future<List<Plat>> getPlatRestaurant(String restaurantId,String categorieId) async {
  List<Plat> plats = [];
  if(categorieId == "Tout"){
    await FirebaseFirestore.instance.collection('plats').where("restaurant",isEqualTo: restaurantId)
        .get().then((snapshot) => snapshot.docs.forEach((element) {
          Plat plat = Plat(id: element.id, nom: element.data()['nom'], prix: element.data()['prix'], description: element.data()['description'], note: element.data()['note'], categorie: element.data()['categorie'], image: element.data()['image'], restaurant: element.data()['restaurant']);
          plats.add(plat);
    })
    );
  }else{
    await FirebaseFirestore.instance.collection('plats')
     .where("restaurant",isEqualTo: restaurantId)
     .where("categorie",isEqualTo: categorieId)
        .get().then((snapshot) =>  snapshot.docs.forEach((element) {
          Plat plat = Plat(id: element.id, nom: element.data()['nom'], prix: element.data()['prix'], description: element.data()['description'], note: element.data()['note'], categorie: element.data()['categorie'], image: element.data()['image'], restaurant: element.data()['restaurant']);
          plats.add(plat);
    })
    );
  }
  return plats;
}

Future<Plat> getPlat(String platId) async {
  
  final snapshot = await FirebaseFirestore.instance
      .collection('plats').doc(platId).get();
  Plat plat = Plat(id: snapshot.id, nom: snapshot.data()!['nom'], prix: snapshot.data()!['prix'], description: snapshot.data()!["description"], note: snapshot.data()!["note"], categorie: snapshot.data()!["categorie"], image: snapshot.data()!["image"], restaurant: snapshot.data()!["restaurant"]);
  return plat;
}