import 'package:flutter/material.dart';

final List<Car> carsData = [
  Car(
      mark: "Toyota",
      model: "Camry 70",
      image:
          "https://avatars.mds.yandex.net/get-verba/1030388/2a000001786ab6d740f53ca6259ae80885c7/auto_main",
      year: 2018,
      color: Colors.black),
  Car(
      mark: "Honda",
      model: "Fit",
      image:
          "https://www.motortrend.com/uploads/sites/5/2020/05/2020-honda-fit-07.jpg",
      year: 2022,
      color: Colors.red),
  Car(
      mark: "Hyondai",
      model: "Sonata",
      image:
          "https://s.auto.drom.ru/i24232/c/photos/fullsize/hyundai/sonata/hyundai_sonata_887840.jpg",
      year: 2021,
      color: Colors.yellow),
  Car(
      mark: "Lexus",
      model: "RX 350",
      image:
          "https://alfaleasing.ru/catalog-next/_next/image/?url=https://io.ilsa.ru/gallery/catalog/3/0b/5f0a3b4dc8fc919d5e68b4238fd1b0b3.jpg&w=3840&q=70",
      year: 2020,
      color: Colors.yellow),
  Car(
      mark: "BMW",
      model: "X5",
      image:
          "https://cache.bmwusa.com/cosy.arox?pov=walkaround&brand=WBBM&vehicle=25XO&client=byoc&paint=P0300&fabric=FKPSW&sa=S01CE,S01SF,S0255,S02TB,S0302,S0319,S0322,S03AT,S03MB,S0402,S0420,S0423,S0459,S0481,S0494,S04FL,S04KR,S04T8,S04UR,S0552,S05AC,S05AS,S05DM,S0676,S06AC,S06AK,S06C4,S06CP,S06NX,S06U2,S0775&angle=30",
      year: 2025,
      color: Colors.yellow),
];

class Car {
  final String mark;
  final String model;
  final String image;
  final int year;
  final Color color;

  Car({
    required this.mark,
    required this.model,
    required this.image,
    required this.year,
    required this.color,
  });
}
