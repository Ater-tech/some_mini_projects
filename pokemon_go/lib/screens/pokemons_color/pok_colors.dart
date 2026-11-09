import 'package:flutter/material.dart';

Color getPokemonColor(String type) {
  switch (type) {
    case 'fire':
      return const Color.fromARGB(255, 199, 82, 74);
    case 'water':
      return const Color.fromARGB(255, 61, 111, 153);
    case 'grass':
      return const Color(0xff47acac);
    case 'electric':
      return const Color.fromARGB(255, 222, 212, 122);
    case 'ground':
      return const Color.fromARGB(255, 105, 69, 56);
    case 'rock':
      return const Color.fromARGB(255, 88, 80, 77);
    case 'poison':
      return const Color.fromARGB(255, 74, 16, 84);
    case 'psychic':
      return Colors.pink;
    case 'ice':
      return Colors.cyan;
    case 'dragon':
      return const Color(0xFF5E35B1);
    case 'dark':
      return Colors.black87;
    case 'fairy':
      return const Color(0xFFF8BBD0);
    case 'bug':
      return const Color.fromARGB(255, 117, 161, 67);
    case 'normal':
      return const Color.fromARGB(255, 128, 183, 228);
    case 'flying':
      return const Color(0xFF90CAF9);
    case 'fighting':
      return const Color(0xFFD32F2F);
    case 'ghost':
      return const Color(0xFF7E57C2);
    case 'steel':
      return Colors.blueGrey;
    default:
      return const Color.fromARGB(255, 73, 180, 173);
  }
}