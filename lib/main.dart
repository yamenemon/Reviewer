import 'package:flutter/material.dart';
import 'package:reviewer/AddProduct.dart';
// import 'constants.dart' as Constants;
import 'ProductCell.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Reviewer()));
}

class Reviewer extends StatefulWidget {
  @override
  _ReviewerState createState() => _ReviewerState();
}

class _ReviewerState extends State<Reviewer> {
  var _numberOfItems;
  @override
  void initState() {
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
          appBar: AppBar(
            centerTitle: true,
            elevation: 40,
            title: Text("Product"),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.red, Colors.blue])),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            color: Colors.transparent,
            child: ProductCell(),
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
                  gradient: LinearGradient(colors: [Colors.red, Colors.blue])),
            ),
            onPressed: () {
              addProduct();
            },
          )),
    );
  }
}
