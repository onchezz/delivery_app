import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This your Chekout Histoty'), actions: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart))
      ]),
    );
  }
}
