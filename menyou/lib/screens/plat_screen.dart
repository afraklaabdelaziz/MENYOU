import 'package:flutter/material.dart';
import 'package:menyou/models/categorie.dart';
import 'package:menyou/models/plat.dart';
import 'package:menyou/models/restaurant.dart';
import 'package:menyou/screens/product_detailles_screen.dart';
import 'package:menyou/services/plat_service.dart';
import 'package:rive/rive.dart';

import '../configuration.dart';
import '../services/categorie_service.dart';

class PlatList extends StatefulWidget {
  const PlatList({Key? key, required this.restaurant}) : super(key: key);
  final Restaurant restaurant;
  @override
  State<PlatList> createState() => _PlatListState(restaurant);
}

class _PlatListState extends State<PlatList> {
  int selected = 0;
  int checkPanier = 0;
  int currentPage = 0;
  String idCategorie = "Tout";
  bool isShowLoading = false;
  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  Restaurant restaurant;
  _PlatListState(this.restaurant);
  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    return controller!;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(restaurant.nom, style: TextStyle(
            color: Colors.white,
            fontSize: 28
        ),) ,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(restaurant.image),
                  fit: BoxFit.fill
              )
          ),
        ),

      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Categorie> categories = snapshot.data!;
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
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
                                    idCategorie = categories[index].id;
                                  });
                                },
                                child: Container(
                                  width: 110,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: selected == index
                                          ? Colors.orange
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage:
                                            AssetImage(categories[index].image),
                                      ),
                                      Text(
                                        categories[index].nom,
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
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }),
          Container(
            child: Expanded(
              child: Stack(children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                      future: getPlatRestaurant(restaurant.id, idCategorie),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Plat> plats = snapshot.data!;
                          return GridView.count(
                            childAspectRatio: 0.58,
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(plats.length, (index) {
                              return Container(
                                  child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                )),
                                child: Stack(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) {
                                          return ProductDetailles(
                                            idPlat: plats[index].id,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Image.asset(
                                                plats[index].image,
                                                fit: BoxFit.cover,
                                                width: 130,
                                              ),
                                            ),
                                            Text(
                                              plats[index].nom,
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
                                                    plats[index].nom,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black87),
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
                                                        Text(
                                                          plats[index].note.toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black87),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text("Prix ",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black87),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                                    child: Text(plats[index].prix.toString() + " \$",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.orangeAccent,
                                                          fontSize: 18
                                                    )),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        panier.forEach((p) {
                                                          if(plats[index].id == p.id){
                                                            checkPanier++;
                                                          }
                                                        });
                                                        isShowLoading = true;
                                                      });
                                                      Future.delayed(
                                                          Duration(seconds: 1), () {
                                                            if(checkPanier == 0){
                                                              panier.add(plats[index]);
                                                            }else{
                                                              panier.remove(plats[index]);
                                                              plats[index].quantity++;
                                                              panier.add(plats[index]);
                                                              setState(() {
                                                                checkPanier = 0;
                                                              });
                                                            }

                                                        check.fire();
                                                        Future.delayed(
                                                            Duration(seconds: 2),
                                                            () {
                                                          setState(() {
                                                            isShowLoading = false;
                                                          });
                                                        });
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.orange[300],
                                                        size: 35
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(Icons.favorite,color: Colors.red,size: 35,),
                                                    onPressed: () {
                                                      setState(() {
                                                        favorie.add(plats[index]);
                                                      });
                                                    },
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
                              ));
                            }),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }),
                ),
                isShowLoading
                    ? Positioned.fill(
                        child: Column(
                          children: [
                            Spacer(),
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: RiveAnimation.asset(
                                "assets/rive/check.riv",
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      getRiveController(artboard);
                                  check =
                                      controller.findSMI("Check") as SMITrigger;
                                  error =
                                      controller.findSMI("Error") as SMITrigger;
                                  reset =
                                      controller.findSMI("Reset") as SMITrigger;
                                },
                              ),
                            ),
                            Text(
                              "success",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 13),
                            ),
                            Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
