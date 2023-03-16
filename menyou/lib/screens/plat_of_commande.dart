import 'package:flutter/material.dart';
import 'package:menyou/models/commande_items.dart';
import 'package:menyou/services/plat_service.dart';

import '../models/plat.dart';
import '../services/commande_service.dart';

class PlatCommade extends StatefulWidget {
  const PlatCommade({Key? key, required this.commandeRef}) : super(key: key);
  final String commandeRef;

  @override
  State<PlatCommade> createState() => _PlatCommadeState(commandeRef);
}
class _PlatCommadeState extends State<PlatCommade> {
  String commandeRef;
  _PlatCommadeState(this.commandeRef);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getCammandeItems(commandeRef),
          builder: (context,snapshot) {
            if(snapshot.hasData){
              List<CommandeItems> commandeItems = snapshot.data!;
            return
              Container(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: commandeItems.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: getPlat(commandeItems[index].plat),
                            builder: (context,snapshot) {
                              if(snapshot.hasData){
                              Plat plat = snapshot.data!;
                             return
                               Container(
                                 child: Row(
                                   children: [
                                     Container(
                                         alignment: Alignment.center,
                                         margin: EdgeInsets.only(top: 60, bottom: 20),
                                         child:Image.asset(plat.image,width: 150,height: 150,)
                                     ),
                                     Expanded(
                                         child: Container(
                                           margin: EdgeInsets.only(top: 60, bottom: 20),
                                           decoration: BoxDecoration(
                                               color: Colors.white.withOpacity(0.5),
                                               borderRadius: BorderRadius.only(
                                                   topRight: Radius.circular(20),
                                                   bottomRight: Radius.circular(20))),
                                           child: Column(
                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [
                                               Row(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment.spaceAround,
                                                 children: [
                                                   Text(
                                                     plat.nom,
                                                     style: TextStyle(
                                                       fontWeight: FontWeight.bold,
                                                       fontSize: 20,
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               Text(
                                                 plat.prix.toString() + "\$",
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                 ),
                                               ),
                                               Text(
                                                 plat.nom,
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ))
                                   ],
                                 ),
                               );
                            }else{
                              return Text('${snapshot.hasError}');
                              }
                            }
                          );
                        }),
                  ));
          }else{
              return Text('${snapshot.hasError}');
            }
          }
      ),
    );
  }
}
