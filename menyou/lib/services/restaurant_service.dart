import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/restaurant.dart';

// Future<Restaurant> getRestaurant(String restaurantId,String idCategorie) async{
//   DocumentSnapshot restaurantSnapshot;
//   if(idCategorie == ""){
//     restaurantSnapshot = await FirebaseFirestore.instance.collection('restaurants').doc(restaurantId).get();
//   }else{
//    restaurantSnapshot = await FirebaseFirestore.instance.collection('restaurants').doc(restaurantId).get();
//   }
//   print(restaurantSnapshot.data());
//   Restaurant restaurant = Restaurant.fromJson(restaurantSnapshot.data() as Map);
//   print(restaurant.nom);
//  return restaurant;
// }

Future<List<Restaurant>> getRestaurantList() async {
  List<Restaurant> restaurants = [];
 await FirebaseFirestore.instance.collection('restaurants').get()
     .then((snapshot) => snapshot.docs.forEach((element) {
   Restaurant restaurant =  Restaurant(id: element.id, nom:element.data()['nom'] , ville: element.data()['ville'], image: element.data()['image'],adresse: element.data()['adresse']);
   restaurants.add(restaurant);
  }));
 return restaurants;
}
