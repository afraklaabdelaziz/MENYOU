import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:menyou/components/layout.dart';
import 'package:menyou/components/panier_drawer.dart';
import 'package:menyou/screens/commande_screen.dart';
import 'package:menyou/screens/favorie.dart';
import 'package:menyou/screens/leading_page.dart';
import 'package:menyou/screens/panier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:menyou/screens/restaurant_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
   AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'channelKey',
            channelName: 'channelName',
            channelDescription: 'channelDescription'
        )
      ],
      debug: true
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: LeadingPage()
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List<Widget> pages = [RestaurantList(),Panier(),Favorie(),ListCommande()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:
        PanierDrawer(),

      body:
      Container(
      color: Colors.grey[200],
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Layout(),
            pages[currentPage]
          ],
        ),
      ),
     bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.restaurant), label: 'restaurant'),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'panier'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'favories'),
            NavigationDestination(icon: Icon(Icons.shopping_cart_checkout_sharp), label: 'commandes'),
          ],
          onDestinationSelected: (int index) {
           setState(() {
             currentPage = index;
           });
          },
          selectedIndex: currentPage,
        ),
    );
  }
}
