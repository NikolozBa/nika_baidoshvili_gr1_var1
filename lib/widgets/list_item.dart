import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String price;

  const ListItem({
    @required this.imgUrl,
    @required this.name,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInImage(
              width: double.infinity,
              height: height*0.3,
              //fit: BoxFit.cover,
              placeholder: AssetImage("assets/clothes_placeholder.png"),
              image: NetworkImage(imgUrl),
            ),
            Container(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                ),
              ),
              height: height*0.04,
              width: double.infinity,
            ),
            Container(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: Text(
                  price,
                ),
              ),
              height: height*0.035,
              width: double.infinity,
            ),

          ],
        ),
      ),
    );
  }
}
