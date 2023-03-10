import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menyou/components/app_bar.dart';
import 'package:menyou/models/restaurant.dart';
class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  List<Restaurant> restaurants = [];
  Future getDocIds() async {
    await FirebaseFirestore.instance.collection('restaurants').get()
        .then((snapshot) => snapshot.docs.forEach((element) {
      restaurants.add(Restaurant.fromJson(element.data()));
      print(element.data());
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: FutureBuilder(
              future: getDocIds(),
              builder: (context,snapshot){
                 return GridView.count(
                   childAspectRatio: 0.8,
                   // Create a grid with 2 columns. If you change the scrollDirection to
                   // horizontal, this produces 2 rows.
                   crossAxisCount: 2,
                   mainAxisSpacing: 10,
                   crossAxisSpacing: 10,
                   // Generate 100 widgets that display their index in the List.
                   children: List.generate(restaurants.length, (index) {
                     return
                       Container(
                           width: double.infinity,
                           height:double.infinity,
                           child: Card(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20)
                             ),
                             child: TextButton(
                               onPressed: () {
                                 Navigator.of(context)
                                     .push(MaterialPageRoute(builder: (BuildContext context) {
                                   return HomeScreen();
                                 }));
                               },
                               child: Container(
                                 padding: EdgeInsets.symmetric(horizontal: 20),
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     borderRadius: BorderRadius.circular(20)
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Container(
                                       height: 85,
                                       width: 250,
                                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe7Nygt8FbPUxi8GWX0aWd6_hpckXHyb46qQ&usqp=CAU")
                                     ),
                                     Text(
                                       restaurants[index].nom,
                                       style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20,
                                           color: Colors.black87),
                                     ),
                                     Container(
                                       width: 120,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(
                                             restaurants[index].nom,
                                             style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.black87),
                                           ),
                                         ],
                                       ),
                                     ),
                                     Container(
                                       width: 120,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Text(
                                             restaurants[index].ville,
                                             style: TextStyle(
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.black87),
                                           ),
                                           IconButton(
                                             onPressed: () {
                                             },
                                             icon: Icon(
                                               Icons.shopping_cart,
                                               color: Colors.orange[300],
                                             ),
                                           )
                                         ],
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),


                           ));
                   }),
                 );
              },
            )
          );

  }
}
