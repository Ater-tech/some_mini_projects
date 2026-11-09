import 'package:flutter/material.dart';
import 'row.dart';
import 'column.dart';
import 'row_and_column.dart';
import 'cont_row.dart';
import 'single_child_scroll.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});
  final List<String> names = ["Row and Column property", "Column property", "Row and Column property 2", 
  "Container with row and box decoration", "Single Child Scroll"];
  final List<Widget> pages = [ThisRow(), ThisColumn(), ThisRowAndColumn(), ThisBoxDeco(), SChScView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row and Column property"),
        animateColor: true,
        backgroundColor: Colors.amberAccent,
        surfaceTintColor: Colors.redAccent,
        leading: Icon(Icons.menu_book),
        actions: [
          Icon(Icons.phone_android_outlined),
          Icon(Icons.phone_callback_outlined),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: names.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(names[index]),
          tileColor: Colors.blueAccent,
        onTap: () => Navigator.push(
          context, 
          MaterialPageRoute(builder:  (context) => pages[index])),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 8,), 
      ));
  }
}
