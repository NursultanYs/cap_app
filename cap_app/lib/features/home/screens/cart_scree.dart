import 'package:cap_app/features/home/providers/favorite_provider.dart';
import 'package:cap_app/features/home/widgets/carlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carts extends StatefulWidget {
  const Carts({super.key});

  @override
  State<Carts> createState() => _FavouritesState();
}

class _FavouritesState extends State<Carts> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<FavoriteProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: CarListView(cartList: list.cartList),
      ),
    );
  }
}
