import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/home/counter.dart';
import 'package:cap_app/features/home/data_provider.dart';
import 'package:cap_app/features/home/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: ListTile(
                          trailing: Counter(
                            index: index,
                          ),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              context
                                  .read<DataProvider>()
                                  .cartList[index]
                                  .image,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            context.read<DataProvider>().cartList[index].name,
                            style:
                                AppTextstyles.regular.withColor(Colors.white),
                          ),
                          subtitle: Text(
                            "${(context.read<DataProvider>().cartList[index].price)} som",
                            style:
                                AppTextstyles.medium.withColor(Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                itemCount: context.read<DataProvider>().cartList.length),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopScreen()));
            },
            child: const Text("Shop"),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<DataProvider>().cartList.length = 0;
              setState(() {});
            },
            child: const Text("Clear"),
          ),
        ],
      ),
    ));
  }
}
