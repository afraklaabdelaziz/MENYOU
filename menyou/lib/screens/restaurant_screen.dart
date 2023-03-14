import 'package:flutter/material.dart';
import 'package:menyou/main.dart';
import 'package:menyou/screens/plat_screen.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';
class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    return Container(
                child: Expanded(
                  child: FutureBuilder(
                    future: getRestaurantList(),
                    builder: (context,snapshot){
                      if (snapshot.hasData) {
                       List<Restaurant> restaurants = snapshot.data!;
                       return GridView.count(
                         childAspectRatio: 0.88,
                         // Create a grid with 2 columns. If you change the scrollDirection to
                         // horizontal, this produces 2 rows.
                         crossAxisCount: 2,
                         mainAxisSpacing: 10,
                         crossAxisSpacing: 10,
                         // Generate 100 widgets that display their index in the List.
                         children: List.generate(restaurants.length, (index) {
                           return Card(
                                   shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.only(
                                   bottomRight: Radius.circular(15),
                                    bottomLeft:Radius.circular(15),
                                 )
                                   ),
                                   child: TextButton(
                                     onPressed: () {
                                       print(restaurants[index].id);
                                       Navigator.of(context)
                                           .push(MaterialPageRoute(builder: (BuildContext context) {
                                         return PlatList(restaurantId: restaurants[index].id,);
                                       }));
                                     },
                                     child: Container(
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Image.network(restaurants[index].image,
                                             fit: BoxFit.cover,height:95 ,width:260 ,),
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
                                                     Icons.star,
                                                     color: Colors.orange[300],
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ),
                                           Text(restaurants[index].adresse)
                                         ],
                                       ),
                                     ),
                                   ),


                                 );
                         }),
                       );
                    } else if (snapshot.hasError) {
                     return Text('${snapshot.error}');
                      }
                     return const CircularProgressIndicator();
                    },

                  ),
                )
              );

  }
}
