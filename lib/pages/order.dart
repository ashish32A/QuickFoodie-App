import 'package:flutter/material.dart';

import '../widgets/widget_support.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
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
                    "Order",
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
