import 'package:cap_app/features/cart/cars_data.dart';
import 'package:flutter/material.dart';

class CarsCatalog extends StatelessWidget {
  const CarsCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final list = carsData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars"),
      ),
      body: ListView.separated(
          itemBuilder: (context, itemBuilder) => Container(
            
          ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: list.length),
    );
  }
}
