import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/categorie.dart';

Future<List<Categorie>> getCategories() async {
  List<Categorie> categories = [];
  await FirebaseFirestore.instance.collection('categories')
      .get().then((snapshot) => snapshot.docs.forEach((element) {
        Categorie categorie = Categorie(id: element.id, nom: element.data()['nom'], image: element.data()['image']);
    categories.add(categorie);
  })
  );
  return categories;
}