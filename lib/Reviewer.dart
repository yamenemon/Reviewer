import 'package:flutter/material.dart';
import 'package:reviewer/Models/Product.dart';
import 'package:reviewer/Services/fetchProducts.dart';
import 'AddProduct.dart';
import 'ProductCell.dart';
import 'ReviewerAppBar.dart';

class Reviewer extends StatefulWidget {
  @override
  _ReviewerState createState() => _ReviewerState();
}

class _ReviewerState extends State<Reviewer> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //CALL API
  }

  @override
  Widget build(BuildContext context) {
    addProduct() {
      print("function called");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddProduct()));
    }

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Scaffold(
          appBar: ReviewerAppBar(
            titleText: "Product",
          ),
          body: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            color: Colors.transparent,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FutureBuilder(
                  future: fetchProducts(),
                  builder: (context, snapshot) {
                    List<Product> data = snapshot.data;
                    return snapshot.hasData
                        ? ProductCell(furnitureProducts: data)
                        : Center(child: Image.asset('images/ripple.gif'));
                  },
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.add,
                size: 30,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: <Color>[
                    Colors.deepPurpleAccent[100],
                    Colors.indigo[100]
                  ])),
            ),
            onPressed: () {
              addProduct();
            },
          )),
    );
  }
}
