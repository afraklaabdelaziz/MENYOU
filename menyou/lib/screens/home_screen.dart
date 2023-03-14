import 'package:flutter/material.dart';
import 'package:menyou/screens/plat_screen.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
   int selected = 0;
  PageController pageController = PageController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool isShowLoading = false;
  late SMITrigger check;
  late SMITrigger error ;
  late SMITrigger reset;
  StateMachineController getRiveController (Artboard artboard){
   StateMachineController? controller = StateMachineController.fromArtboard(artboard,"State Machine 1");
   artboard.addController(controller!);
   return controller!;
  }

  @override
  Widget build(BuildContext context) {
   return Text("data");
  }
}








































































// Container(
//   // width: 400,
//   height: 460,
//   child: ListView.builder(
//       // scrollDirection: Axis.vertical,
//       itemCount: plats.length,
//       itemBuilder: (context,index){
//         return  Container(
//           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context)
//                       .push(MaterialPageRoute(builder: (BuildContext context) {
//                     return ProductDetailles(index: index,);
//                   }));
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 85,
//                         child: Row(
//                           children: [
//                             Image.asset(plats[index]["image"]),
//                           ],
//                         ),
//                       ),
//                       Text(
//                         plats[index]["name"],
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Colors.black87),
//                       ),
//                       Container(
//                         width: 120,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               plats[index]["name"],
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87),
//                             ),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.star,
//                                       color: Colors.yellow,
//                                     ),
//                                   ),
//                                   Text(
//                                     "4.5",
//                                     style: TextStyle(color: Colors.black87),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 120,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               plats[index]['prix'].toString(),
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black87),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                               },
//                               icon: Icon(
//                                 Icons.accessibility_sharp,
//                                 color: Colors.orange[300],
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//   ),
// )