import 'package:flutter/material.dart';

class ReviewerAppBar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => const Size.fromHeight(64);

  const ReviewerAppBar({
    Key key,
    @required this.titleText,
  }) : super(key: key);
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 40,
      title: Text('$titleText'),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: <Color>[Colors.red, Colors.blue])),
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
