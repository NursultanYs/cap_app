import 'package:cap_app/features/home/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  final int index;
  const Counter({super.key, required this.index});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late ValueNotifier<int> _counter;
  late DataProvider providerR;
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    providerR = context.read<DataProvider>();
    _counter = ValueNotifier<int>(
        context.read<DataProvider>().cartList[widget.index].count);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(children: [
        IconButton(
            onPressed: () {
              context.read<DataProvider>().addProduct(
                  newProduct:
                      context.read<DataProvider>().cartList[widget.index],
                  isAdd: true);
              _counter.value += 1;
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              context.read<DataProvider>().addProduct(
                  newProduct:
                      context.read<DataProvider>().cartList[widget.index],
                  isAdd: false);
              _counter.value -= 1;
            },
            icon: const Icon(Icons.remove)),
        ValueListenableBuilder(
            valueListenable: _counter,
            builder: (context, value, child) {
              return Text(
                  "X${context.watch<DataProvider>().cartList[widget.index].count}");
            }),
      ]),
    );
  }
}
