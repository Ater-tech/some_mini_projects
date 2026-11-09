import 'package:flutter/material.dart';

SliverAppBar bar(){
  return SliverAppBar.large(
    // backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    elevation: 0,
    title: Text(
      "What Pokemon are you looking for?",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
  
  );
}