import 'package:cap_app/features/home/models/cars_data.dart';
import 'package:cap_app/features/home/screens/cart_scree.dart';
import 'package:flutter/material.dart';
import 'package:cap_app/core/extensensions/textStyle_extension.dart';
import 'package:cap_app/core/resource/app_assets.dart';
import 'package:cap_app/core/theme/app_textStyles.dart';
import 'package:cap_app/features/home/widgets/carlist.dart';
import 'package:cap_app/features/home/widgets/drawer.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child: InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Image.asset(
                        AppAssets.drawer,
                        width: 41,
                        height: 39,
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Carts();
                      }));
                    },
                    child: Image.asset(AppAssets.cart)),
              ],
            ),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 30),
                padding: const EdgeInsets.only(top: 20, left: 11),
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "30%",
                          style: AppTextstyles.regular
                              .withFontSize(48)
                              .withColor(const Color(0xFFE5E5E5))
                              .withFamily("Imprima"),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 45, right: 25),
                          child: Text(
                            "Off",
                            style: AppTextstyles.regular
                                .withFontSize(55)
                                .withColor(const Color(0xFFFCC21B))
                                .withFamily("Imprima"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "THIS JULY",
                          style: AppTextstyles.regular
                              .withFontSize(22)
                              .withFamily("Imprima")
                              .withColor(Colors.white),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6, bottom: 11),
                          width: 126,
                          child: Text(
                            "Travel to the end of the world this whole month\n cause we care when you are happy",
                            style: AppTextstyles.regular
                                .withColor(Colors.white)
                                .withFamily("Kaushan")
                                .withFontSize(10),
                          ),
                        ),
                        SizedBox(
                          width: 133,
                          height: 18,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF988080),
                            ),
                            child: Text(
                              "Try Now",
                              style: AppTextstyles.bold
                                  .withFontSize(11)
                                  .withColor(Colors.white)
                                  .withFamily("Roboto"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Cars Available Near You",
                style:
                    AppTextstyles.regular.withFontSize(20).withFamily("Roboto"),
              ),
              const SizedBox(height: 20),
              CarListView(
                cartList: carsData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
