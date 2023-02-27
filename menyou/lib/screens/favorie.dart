import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
import 'package:menyou/main.dart';

class Favorie extends StatefulWidget {
  const Favorie({Key? key}) : super(key: key);

  @override
  State<Favorie> createState() => _FavorieState();
}

class _FavorieState extends State<Favorie> {
  @override
  Widget build(BuildContext context) {
    if (favorie.length == 0) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 300),
          child: Column(
            children: [
              Center(
                child: Text(
                  "List favories est Vide",
                  style: TextStyle(fontSize: 30,color: Colors.black87),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                  return Home();
                }),);
              }, child: Text("List Produits"),)
            ],
          ),
        ),
      );
    }else {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: panier.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 240,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.orange[300],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.only(top: 40),
                                  ),
                                  Align(
                                    child: Image.asset(favorie[index]["image"]),
                                  )
                                ],
                              )),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 60, bottom: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          favorie[index]["name"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favorie.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    Text(
                                      favorie[index]["prix"].toString() + "\$",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      favorie[index]["quantity"].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  }
              )
          )
      );
    }
  }
}
