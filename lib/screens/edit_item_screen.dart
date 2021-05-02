import 'package:flutter/material.dart';
import 'package:nika_baidoshvili_gr1_var1/data/clothes_model.dart';
import 'package:nika_baidoshvili_gr1_var1/helper_methods/helpers.dart';

class EditItem extends StatelessWidget {
  static const route = "/edit-item";

  final _formKey = GlobalKey<FormState>();

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController size = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Clothes item = arguments["item"];
    final int index = arguments["index"];

    id.text = item.id.toString();
    name.text = item.name;
    url.text = item.imageUrl;
    size.text = item.size;
    price.text = item.price.toString();
    description.text = item.description;


    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Edit item"),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 35,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: id,
                      decoration: InputDecoration(
                        hintText: "Please enter ID",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == "" || value.isEmpty || double.tryParse(value)==null) {
                          return "Please enter valid ID";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Please enter name",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == "" || value.isEmpty) {
                          return "Please enter valid name";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: url,
                      decoration: InputDecoration(
                        hintText: "Please enter image",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == "" || value.isEmpty) {
                          return "Please enter valid image";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: size,
                      decoration: InputDecoration(
                        hintText: "Please enter size",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == "" || value.isEmpty) {
                          return "Please enter valid size";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: price,
                      decoration: InputDecoration(
                        hintText: "Please enter price",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == "" || value.isEmpty || double.tryParse(value)==null) {
                          return "Please enter valid price";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 40,
                  ),
                  child: Material(
                    elevation: 8,
                    child: TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        hintText: "Please enter description",
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == "" || value.isEmpty) {
                          return "Please enter valid description";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints:
                        BoxConstraints.tightFor(height: 40, width: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: FittedBox(
                            child: Text(
                              "Back",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      ConstrainedBox(
                        constraints:
                        BoxConstraints.tightFor(height: 40, width: 100),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Helpers.editItem(
                                Clothes(
                                  id: int.parse(id.text),
                                  name: name.text,
                                  imageUrl: url.text,
                                  size: size.text,
                                  price: double.parse(price.text),
                                  description: description.text,
                                ),
                                index
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: FittedBox(
                            child: Text(
                              "Edit",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
