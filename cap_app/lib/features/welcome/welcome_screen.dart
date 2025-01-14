import 'package:cap_app/core/resource/app_assets.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  AppAssets.welcomeBg,
                  fit: BoxFit.cover,
                )),
          ),
          Positioned.fill(
              top: 218,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 310),
                      child: Image.asset(AppAssets.welcomeLogo)),
                  Container(
                    margin: EdgeInsets.only(bottom: 70),
                    child: Text(
                      "Rent your dream car from the Best Company",
                      style: TextStyle(
                          fontSize: 27,
                          fontFamily: "Hind",
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(246, 246, 246, 0.81)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFC64949)),
                      onPressed: () {},
                      child: SizedBox(
                        width: 243,
                        height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Get Started",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "Inconsolata",
                                    color: Colors.white)),
                            Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Image.asset(AppAssets.arrowButton))
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
