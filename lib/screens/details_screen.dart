import 'package:flutter/material.dart';
import 'package:nika_baidoshvili_gr1_var1/data/clothes_model.dart';
import 'package:nika_baidoshvili_gr1_var1/helper_methods/helpers.dart';

class DetailsScreen extends StatelessWidget {
  static const route = "/details";

  @override
  Widget build(BuildContext context) {
    final Clothes item = ModalRoute.of(context).settings.arguments;

    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Details"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Delete this item?"),
                  content: Text("Do you really want to delete this item?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Helpers.deleteClothes(item);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No"),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInImage(
              width: double.infinity,
              height: height * 0.6,
              placeholder: AssetImage("assets/clothes_placeholder.png"),
              image: NetworkImage(item.imageUrl),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text("Name:"),
                  ),
                ),
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text(item.name),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text("Price:"),
                  ),
                ),
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text(item.price.toString()),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text("Size:"),
                  ),
                ),
                Container(
                  height: height * 0.04,
                  child: FittedBox(
                    child: Text(item.size),
                  ),
                ),
              ],
            ),
            Container(
              height: height * 0.10,
              width: double.infinity,
              child: Text(
                item.description,
                style: TextStyle(
                  fontSize: height * 0.035,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
