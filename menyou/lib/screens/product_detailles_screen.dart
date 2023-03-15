import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';

import '../models/plat.dart';
import '../services/plat_service.dart';

class ProductDetailles extends StatefulWidget {
  const ProductDetailles({Key? key, required this.idPlat}) : super(key: key);
  final String idPlat;
  @override
  State<ProductDetailles> createState() => _ProductDetaillesState(idPlat);
}
class _ProductDetaillesState extends State<ProductDetailles> {
  int quantity = 1;
  String idPlat;
  _ProductDetaillesState(this.idPlat);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.orange[400]),
            child: FutureBuilder(
              future: getPlat(idPlat),
              builder: (context,snapshot) {
              if (snapshot.hasData) {
              Plat plat = snapshot.data!;
                return Column(children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                                Icons.arrow_back_ios, color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  favorie.add(plat);
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ))
                        ],
                      )),
                  Container(
                    child: Expanded(
                        child: Stack(
                          children: [
                            Container(
                              padding:
                              EdgeInsets.only(right: 40, top: 140, left: 40),
                              margin: EdgeInsets.only(top: 150),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50),
                                ),
                              ),
                              child: ListView(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                        mainAxisAlignment:MainAxisAlignment.center,
                                        children: [
                                          IconButton(icon: Icon(
                                              Icons.remove_circle,
                                              color: quantity != 1 ? Colors.orange : Colors.grey,
                                              weight: 2),
                                            onPressed: () {
                                              setState(() {
                                                quantity--;
                                              });
                                              if(quantity <=1){
                                                quantity = 1;
                                              }
                                            },
                                          ),
                                          Text(quantity.toString()),
                                          IconButton(icon: Icon(
                                              Icons.add_circle,
                                              color:  Colors.orange,
                                              weight: 2),
                                            onPressed: () {
                                              setState(() {
                                                quantity++;
                                              });
                                            },
                                          ),
                                        ])
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 140, vertical: 30),
                                    child: Text(
                                        plat.prix.toString() + "\$"),
                                  ),
                                  Container(
                                    child: Text(
                                      plat.nom,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(plat.description),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text("4.5")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text(plat.note.toString())
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {

                                                  },
                                                  icon: Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text("4.5")
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                  Container(
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(
                                              Colors.orange),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            plat.quantity = quantity;
                                            panier.add(plat);
                                          });
                                        },
                                        child: Text("AJOUTER AU PANIER"),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              child: Image.asset(plat.image),
                              ),
                          ],
                        )), //  Container(

                    //   height: 700,
                    //    child: Expanded(
                    //         child:Stack(
                    //           children: [
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //               ),
                    //               margin: EdgeInsets.only(top:40),
                    //             ),
                    //             Align(
                    //                child: Image.asset("assets/images/afrakla.png"),
                    //             )
                    //           ],
                    //         )
                    //     ),
                    // )
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
              }
            )));
  }
}
