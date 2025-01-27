import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/home/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  final List<Product> allProducts = [
    Product(
      name: "Milk",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/004-soymilk.jpg/640px-004-soymilk.jpg",
      price: 100,
    ),
    Product(
      name: "Bread",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUSs9uzgvbLN9uyV_XzMuqDKpCUeVcr-RyBQ&s",
      price: 30,
    ),
    Product(
      name: "Potato",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd2cQMUYQstQZ3cF0xx2vcld98c8tK_-e8Yw&s",
      price: 40,
    ),
    Product(
        name: "Tomato",
        image:
            "https://media.istockphoto.com/photos/tomato-isolated-on-white-background-picture-id466175630?k=6&m=466175630&s=612x612&w=0&h=fu_mQBjGJZIliOWwCR0Vf2myRvKWyQDsymxEIi8tZ38=",
        price: 120)
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  context
                      .read<DataProvider>()
                      .addProduct(newProduct: allProducts[index], isAdd: true);
                },
                child: ListTile(
                  trailing: Text("X${0}"),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      allProducts[index].image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    allProducts[index].name,
                    style: AppTextstyles.regular.withColor(Colors.white),
                  ),
                  subtitle: Text(
                    "${(allProducts[index].price)} som",
                    style: AppTextstyles.medium.withColor(Colors.yellow),
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: allProducts.length);
  }
}
