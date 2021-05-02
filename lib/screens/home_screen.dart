import 'package:flutter/material.dart';
import 'package:nika_baidoshvili_gr1_var1/data/clothes_model.dart';
import 'package:nika_baidoshvili_gr1_var1/data/dummy_data.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/details_screen.dart';
import 'package:nika_baidoshvili_gr1_var1/screens/edit_item_screen.dart';
import 'package:nika_baidoshvili_gr1_var1/widgets/list_item.dart';

import 'add_new_item_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Clothes> clothes = DUMMY_DATA;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Clothes"),
        ),
      ),
      body: GridView.builder(
          shrinkWrap: true,
          itemCount: clothes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: width/height,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DetailsScreen.route,
                  arguments: clothes[index],
                ).then((value) {
                  setState(() {});
                });
              },
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditItem.route,
                  arguments: {
                    "item": clothes[index],
                    "index": index,
                  },
                ).then((value){setState(() {
                });});
              },
              child: ListItem(
                imgUrl: clothes[index].imageUrl,
                name: clothes[index].name,
                price: clothes[index].price.toString(),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddItem.route).then(
            (value) {
              setState(() {});
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
