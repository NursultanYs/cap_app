import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/home/models/cars_data.dart';
import 'package:cap_app/features/home/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarListView extends StatefulWidget {
  const CarListView({super.key});

  @override
  State<CarListView> createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView> {
  final carList = carsData;
  @override
  Widget build(BuildContext context) {
    final list = context.read<FavoriteProvider>().favoriteList;
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  carList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carList[index].mark,
                      style: AppTextstyles.bold.withFontSize(25),
                    ),
                    Text(
                      " ${carList[index].model} ${carList[index].year}",
                      style: AppTextstyles.medium.withFontSize(20),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          final favoriteProvider =
                              Provider.of<FavoriteProvider>(context,
                                  listen: false);
                          favoriteProvider.changeFavorite(
                              newFavorite: carList[index]);
                          print(favoriteProvider.favoriteList);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: list.contains(carList[index])
                              ? Colors.red
                              : Colors.grey,
                        ))
                  ],
                )
              ],
            )
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: carList.length,
      ),
    );
  }
}
