import 'package:flutter/material.dart';
import 'package:menyou/models/commande.dart';
import 'package:menyou/screens/plat_of_commande.dart';
import 'package:menyou/services/commande_service.dart';

class ListCommande extends StatelessWidget {
  const ListCommande({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCammande("client1"),
      builder: (context,snapshot) {
        if(snapshot.hasData){
      List<Commande> commandes = snapshot.data!;
        return Expanded(
            child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: ListView.builder(
                itemCount: commandes.length,
                itemBuilder: (context, index) {
                  return Container(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceAround,
                                    children: [
                                      Text(
                                       "prix Total: "+ commandes[index].prixTotal.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black87
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "date: "+commandes[index].date.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87
                                    ),
                                  ),
                                  TextButton(onPressed: (){
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (BuildContext context) {
                                        return PlatCommade(commandeRef: commandes[index].reference);
                                      }));
                                  },
                                      child: Row(
                                        children: [
                                          Text("view detailles",style:TextStyle(color: Colors.lightBlueAccent,fontSize: 20),),
                                          Icon(Icons.remove_red_eye_outlined,color: Colors.lightBlueAccent,size: 25,)
                                        ],
                                      ) )
                                ],
                              ),
                            )
                    );
                }),
          ),
        );
      }else{
    return Text('${snapshot.hasError}');
    }
  }
    );
  }
}
