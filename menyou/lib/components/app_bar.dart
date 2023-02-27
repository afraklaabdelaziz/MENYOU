import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';

import '../screens/product_detailles_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: selected == index
                                ? Colors.orange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                  "assets/images/Screenshot 2023-02-24 185954.png"),
                            ),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: 400,
          height: 460,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: plats.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ProductDetailles(index: index);
                          }));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 85,
                                child: Row(
                                  children: [
                                    Image.asset(plats[index]["image"]),
                                  ],
                                ),
                              ),
                              Text(
                                plats[index]["name"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black87),
                              ),
                              Container(
                                width: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      plats[index]["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                                color: Colors.black87),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      plats[index]['prix'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.accessibility_sharp,
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
                    ],
                  ),
                );
              }),
        )
      ],
    );
// TextButton(
//   onPressed: () {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (BuildContext context) {
//       return ProductDetailles();
//     }));
//   },
//   child: Container(
//     padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20)
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 85,
//           child: Row(
//             children: [
//               Image.asset(
//                   'assets/images/Screenshot 2023-02-24 185954.png'),
//             ],
//           ),
//         ),
//         Text(
//           "Pitza",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.black87),
//         ),
//         Container(
//           width: 120,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Pitza",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87),
//               ),
//               Container(
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                       ),
//                     ),
//                     Text(
//                       "4.5",
//                       style: TextStyle(color: Colors.black87),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: 120,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "20.20\$",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87),
//               ),
//               IconButton(
//                 onPressed: () {
//                 },
//                 icon: Icon(
//                   Icons.accessibility_sharp,
//                   color: Colors.orange[300],
//                 ),
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),
  }
}
