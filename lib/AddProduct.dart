import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File selectedImage;
  String productNameTxt;
  String productDesTxt;
  var selectedValue;
  final picker = ImagePicker();
  final productNameController = TextEditingController();
  final productDescripController = TextEditingController();


  Future getImageUsingPicker(int buttonTag) async {
    var imageType = ImageSource.camera;
    if (buttonTag == 1) {
      imageType = ImageSource.gallery;
    }
    final pickedFile = await picker.getImage(source: imageType);

    setState(() {
      selectedImage = File(pickedFile.path);
    });
  }

  showPicker() {
    final act = CupertinoActionSheet(
        title: Text("Choose your option"),
        actions: [
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              getImageUsingPicker(0);
              Navigator.of(context, rootNavigator: true).pop("Camera");
            },
            isDefaultAction: true,
          ),
          CupertinoActionSheetAction(
            child: Text('Gallery'),
            onPressed: () {
              getImageUsingPicker(1);
              Navigator.of(context, rootNavigator: true).pop("Gallery");
            },
            isDefaultAction: true,
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
          isDefaultAction: true,
          isDestructiveAction: true,
        ));
    showCupertinoModalPopup(
        context: context, builder: (BuildContext context) => act);
  }

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 320;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 40,
          title: Text("Add Product"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: <Color>[Colors.red, Colors.blue])),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 80 / 320,
                        child: GestureDetector(
                          onTap: () {
                            showPicker();
                          },
                        ),
                        backgroundColor: Colors.white,
                        backgroundImage: selectedImage != null
                            ? FileImage(selectedImage)
                            : AssetImage("images/shoe.jpg"),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Divider(
                      height: 15,
                      color: Colors.purple,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    // color: Colors.red,
                    height: 40 * scale,
                    child: TextField(
                      decoration: InputDecoration(
                          // labelText: "Product Name",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide(color: Colors.purple),
                          ),
                          hintText: 'Product Name'),
                      controller: productNameController,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0.0),
                    // color: Colors.purple,
                    width: 400.0,
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        // labelText: "Product Description",
                        hintText: "Product Description",
                        // icon: new Icon(Icons.home),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      controller: productDescripController,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      // print(selectedImage)
                      /*
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Retrieve the text the that user has entered by using the
                            // TextEditingController.
                            content: Text(productDescripController.text),
                          );
                        },
                      );
                      */

                    //NEED TO INTEGRATE FIREBASE FOR STORING DATA

                    },
                    child: Text('SAVE!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
