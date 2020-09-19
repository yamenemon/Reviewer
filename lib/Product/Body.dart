import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:reviewer/Models/Product.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.cellHeight,
    @required this.scale,
    @required this.cellWidth,
    @required this.onTap, 
    @required this.furnitureProduct,
  }) : super(key: key);

  final double cellHeight;
  final double scale;
  final double cellWidth;
  final Product furnitureProduct;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cellHeight,
        margin: EdgeInsets.only(top: 5 * scale),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.deepPurpleAccent[100],
                Colors.indigo[100]
              ]),
          borderRadius: BorderRadius.circular(15 * scale),
        ),
        width: cellWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
          child: AspectRatio(
            aspectRatio: 0.693,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.6,
                  child: Hero(
                    tag: furnitureProduct.id,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/shoe.jpg',
                      image: furnitureProduct.image,
                      fit: BoxFit.fitHeight,
                    ),
                    transitionOnUserGestures: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5 * scale, left: 10 * scale),
                  child: Text(
                    "${furnitureProduct.title}",
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20 * scale,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 5 * scale, left: 10 * scale, right: 10 * scale),
                  child: Text(
                    "${furnitureProduct.description}",
                    maxLines: 3,
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
                      initialRating: double.tryParse(this.furnitureProduct.id),
                      minRating: 1,
                      maxRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: 4.0 * scale),
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
                      "(${furnitureProduct.price}) Reviews",
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
        ),
      ),
    );
  }
}
