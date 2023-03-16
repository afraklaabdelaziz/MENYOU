import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool isDrawerOpen = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            alignLabelWithHint: false,
                            hintText: 'Search',
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none),
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
        ],
      ),
    );
  }
}

