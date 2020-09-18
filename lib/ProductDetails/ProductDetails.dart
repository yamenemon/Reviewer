import 'package:flutter/material.dart';
import 'package:reviewer/Models/Product.dart';
import 'package:reviewer/ReviewerAppBar.dart';

class ProductDetails extends StatefulWidget {
  // final product;
  ProductDetails({Key key, @required this.product}) : super(key: key);
  final Product product;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewerAppBar(
        titleText: "Product Details",
      ),
      body: Container(
        child: Text("${product.description}"),
      ),
    );
  }
}
