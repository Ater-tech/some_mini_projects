import 'dart:math';

import 'package:flutter/material.dart';

class Car {
  String name;
  String model;
  double price;
  bool isElectrocar;

  Car(
    this.name, 
    this.model,
    this.price,
    this.isElectrocar,
    );
}

class CarList extends StatelessWidget{
  final List<Car> cars = List.generate(15, (index) {
    return Car("Tesla $index", "X", 1000.0*index, index.isEven? true: false);
  });
  
  final List<Color> colorsList = [Colors.cyan, Colors.amberAccent, Colors.brown, Colors.grey, Colors.lightGreen, Colors.redAccent];
  CarList({super.key});
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Car classini yaratish and foydalanish"),),
      body: ListView.builder(
        itemBuilder: (context, int index) => SizedBox(
          height: MediaQuery.of(context).size.height*0.2,
          child: Card(
            color: colorsList[Random().nextInt(colorsList.length)],
            child: Center(child: Text(cars[index].name,)),),
        ),
        itemCount: cars.length,
        )
    );
  }
}