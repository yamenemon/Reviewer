import 'package:flutter/material.dart';
import 'package:reviewer/Models/Product.dart';
import 'package:reviewer/ReviewerAppBar.dart';

import '../size_config.dart';

class ProductDetails extends StatefulWidget {
  final Product furnitureProduct;
  ProductDetails({Key key, @required this.furnitureProduct}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    print("${widget.furnitureProduct.image} detail page");
    return Scaffold(
      appBar: ReviewerAppBar(
        titleText: "${widget.furnitureProduct.subTitle}",
      ),
      body: Container(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.6,
              child: Hero(
                tag: widget.furnitureProduct.id,
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/shoe.jpg',
                  image: widget.furnitureProduct.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text("${widget.furnitureProduct.description}")
          ],
        ),
      ),
    );
  }
}
