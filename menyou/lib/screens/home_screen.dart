import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:menyou/configuration.dart';
import 'package:menyou/screens/product_detailles_screen.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDrawerOpen = false;
   int selected = 0;
  int currentPage = 0;
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
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isDrawerOpen = false;
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isDrawerOpen = true;
                          });
                        },
                        icon: Icon(Icons.menu),
                      ),
                Column(
                  children: const [Text("Food menu")],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/afrakla.png"),
                )
              ],
            ),
          ),
          Text(
            "Pitza",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Form(
                key: _formKey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          alignLabelWithHint: false,
                          hintText: 'Search',
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              )),
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
                              color: selected == index ? Colors.orange : Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                               radius:15,
                                backgroundImage: AssetImage(
                                    "assets/images/Screenshot 2023-02-24 185954.png"),
                              ),
                              Text(categories[index]['name'],style: TextStyle(color: Colors.black87),),
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

          Expanded(
            child: Stack(
              children:[ Container(
                height: 460,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.count(
                  childAspectRatio: 0.8,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(plats.length, (index) {
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
                                  return ProductDetailles(index: index,);
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  style: TextStyle(color: Colors.black87),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            plats[index]['prix'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                               setState(() {
                                                 isShowLoading = true;
                                               });
                                               Future.delayed(Duration(seconds: 1),(){
                                                 panier.add(plats[index]);
                                                 check.fire();
                                                 Future.delayed(Duration(seconds: 2),(){
                                                   setState(() {
                                                     isShowLoading = false;
                                                   });
                                                 });
                                               });
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
                ),
              ),
               isShowLoading
                ? Positioned.fill(
                    child: Column(
                      children: [
                        Spacer(),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: RiveAnimation.asset("assets/rive/check.riv",
                          onInit: (artboard){
                            StateMachineController controller = getRiveController(artboard);
                            check = controller.findSMI("Check") as SMITrigger;
                            error = controller.findSMI("Error") as SMITrigger;
                            reset = controller.findSMI("Reset") as SMITrigger;

                          },),
                        ),
                        Text("success",style: TextStyle(color: Colors.green,fontSize: 13),),
                        Spacer(flex: 2,)
                      ],
                    ),
                ) :
                   SizedBox(

                   )
            ]
            ),
          )

        ],
      ),
    );
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