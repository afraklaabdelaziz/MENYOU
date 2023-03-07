import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';

class ProductDetailles extends StatefulWidget {
  const ProductDetailles({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<ProductDetailles> createState() => _ProductDetaillesState(index);
}
class _ProductDetaillesState extends State<ProductDetailles> {

  int quantity = 1;
  int index;
  _ProductDetaillesState(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.orange[400]),
            child: Column(children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              favorie.add(plats[index]);
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
                      height: 1000,
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(right: 40,top: 140,left: 40),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.orange),
                                      minimumSize: MaterialStatePropertyAll(
                                          Size(10, 10)),
                                      maximumSize: MaterialStatePropertyAll(
                                          Size(40, 40))),
                                  onPressed: () {
                                    setState(() {
                                      quantity--;
                                      if(quantity<1){
                                        quantity = 1;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                ),
                                Text(quantity.toString()),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.orange),
                                      minimumSize: MaterialStatePropertyAll(
                                          Size(10, 10)),
                                      maximumSize: MaterialStatePropertyAll(
                                          Size(40, 40))),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 140,vertical: 30),
                            child: Text(plats[index]["prix"].toString()+"\$"),
                          ),
                          Container(
                            child: Text(
                                plats[index]["name"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(plats[index]["desc"]),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        Text("4.5")
                                      ],
                                    ),
                                  )
                                ],
                              )),
                          Container(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.orange),
                              ),
                              onPressed: (){
                                setState(() {
                                  panier.add(plats[index]);
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
                      child: CircleAvatar(
                        radius: 130,
                        backgroundImage:
                            AssetImage(plats[index]["image"]),
                      ),
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
            ])));
  }
}
