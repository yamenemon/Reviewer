import 'package:flutter/material.dart';
import 'package:reviewer/ProductDetails/ProductDetails.dart';
import 'package:reviewer/Services/fetchProducts.dart';
import 'Models/Product.dart';
import 'Product/Body.dart';

class ProductCell extends StatelessWidget {
// Thats means we have to  pass it
  const ProductCell({Key key, @required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    var cellHeight = MediaQuery.of(context).size.height / 2.3;
    var cellWidth = MediaQuery.of(context).size.width;
    double scale = MediaQuery.of(context).size.width / 320;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return FutureBuilder(
          future: fetchProducts(),
          builder: (context, snapshot) {
            List<Product> data = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Body(
                  cellHeight: cellHeight,
                  scale: scale,
                  cellWidth: cellWidth,
                  product: data[index],
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  product: data[index],
                                )));
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
