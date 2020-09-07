import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reviewer/AddProduct.dart';
import 'constants.dart' as Constants;

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

class ProductCell extends StatefulWidget {
  @override
  _ProductCellState createState() => _ProductCellState();
}

class _ProductCellState extends State<ProductCell> {
  double rating = 3.5;

  @override
  Widget build(BuildContext context) {
    var cellHeight = MediaQuery.of(context).size.height / 2.3;
    var cellWidth = MediaQuery.of(context).size.width;
    double  scale = MediaQuery.of(context).size.width / 320;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              height: cellHeight,
              margin: EdgeInsets.only(top: 5*scale),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.red, Colors.blue]),
                borderRadius: BorderRadius.circular(15*scale),
              ),
              width: cellWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: cellHeight * 0.50 * scale,
                      width: cellWidth,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/shoe.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft:  Radius.circular(15.0 * scale),
                            topRight:  Radius.circular(15.0 * scale),
                          )),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 5 * scale, left: 10 * scale),
                      child: Text(
                        "Shoe image as a product",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20 * scale,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                           EdgeInsets.only(top: 5 * scale, left: 10 * scale, right: 10 * scale),
                      child: Text(
                        "This is the detail description of the product image.This is the detail description of the product imageThis is the detail description of the product imageThis is the detail description of the product image",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 5 * scale,
                    ),
                    Row(
                      children: [
                        RatingBar(
                          ignoreGestures: true,
                          itemSize: 20 * scale,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0 * scale),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.pinkAccent,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 20 * scale,
                        ),
                        Text(
                          "(36) reviews",
                          style: TextStyle(
                              fontSize: 15 * scale,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}