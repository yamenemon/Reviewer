import 'package:flutter/material.dart';
import 'package:reviewer/Models/Product.dart';
import 'package:reviewer/ReviewerAppBar.dart';

import '../size_config.dart';

class ProductDetails extends StatefulWidget {
  // final product;
  ProductDetails({Key key, @required this.product}) : super(key: key);
  final Product product;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewerAppBar(
        titleText: "Product Details",
      ),
      body: Container(
        child: AspectRatio(
                  aspectRatio: 1.6,
                  child: Hero(
                    tag: product.id,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/shoe.jpg',
                      image: product.image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
      ),
    );
  }
}
