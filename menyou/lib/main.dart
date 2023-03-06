import 'package:flutter/material.dart';
import 'package:menyou/screens/drawer_screen.dart';
import 'package:menyou/screens/favorie.dart';
import 'package:menyou/screens/home_screen.dart';
import 'package:menyou/screens/leading_page.dart';
import 'package:menyou/screens/panier.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  List<Widget> pages = [HomeScreen(),Panier(),Favorie()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          pages[currentPage]
        ],
      ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.account_box), label: 'panier'),
            NavigationDestination(icon: Icon(Icons.account_box), label: 'favories'),
            NavigationDestination(icon: Icon(Icons.account_box), label: 'profile'),
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
