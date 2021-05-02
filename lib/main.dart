import 'package:flutter/material.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/add_new_item_screen.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/details_screen.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/edit_item_screen.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        AddItem.route: (context)=>AddItem(),
        DetailsScreen.route: (context)=>DetailsScreen(),
        EditItem.route: (context)=>EditItem(),
      },
    );
  }
}
