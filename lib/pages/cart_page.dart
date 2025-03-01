import 'package:flutter/material.dart';
import 'package:quickfoodie/widgets/widget_support.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Material(
              elevation: 5.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Cart",
                    style: AppWidget.headlineTextFeildStyle(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
