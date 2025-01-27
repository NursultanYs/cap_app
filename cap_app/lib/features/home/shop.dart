import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/home/ListView.dart';
import 'package:cap_app/features/home/cart.dart';
import 'package:cap_app/features/home/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<int> count = [];
  void inc() {
    setState(() {
      count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(
            child: ShopList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            child: const Text("Cart"),
          ),
        ],
      ),
    ));
  }
}
