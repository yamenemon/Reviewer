import 'package:flutter/material.dart';
import 'package:reviewer/ProductDetails/ProductDetails.dart';
import 'Models/Product.dart';
import 'Product/Body.dart';

class ProductCell extends StatelessWidget {
// Thats means we have to  pass it
  final List<Product> furnitureProducts;

  const ProductCell({Key key, @required this.furnitureProducts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cellHeight = MediaQuery.of(context).size.height / 2.3;
    var cellWidth = MediaQuery.of(context).size.width;
    double scale = MediaQuery.of(context).size.width / 320;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: furnitureProducts.length,
          itemBuilder: (context, index) {
            Product data = furnitureProducts[index];
            return Body(
              cellHeight: cellHeight,
              scale: scale,
              cellWidth: cellWidth,
              furnitureProduct: data,
              onTap: () {
                print("${furnitureProducts[index].image} product page");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetails(
                              furnitureProduct: furnitureProducts[index],
                            )));
              },
            );
          });
    });
  }
}
