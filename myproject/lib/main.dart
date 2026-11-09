import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp());
}


class ExampleApp extends StatelessWidget(){

@override
Widget build(){
  return Center(
    child: Button(
      child: Text('Click this button'),
    ),
  );
}
}

class WindowWithRow extends StatefulWidget {
  WindowWithRow({super.key})
  
  @override
  _WindowWithRowState createState() => _WindowWithRowState();
}

class _WindowWithRowState extends State<WindowWithRow> {
  
  int quantity = 0;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
          children: List<Widget> [
            IconButton(
              icon: Icons.substract,
              onPressed: () {
                setState(() {
                  this.quantity--;
                }
                );
              }                    
              ),

            ),
            new Text('Quantity: ${this.quantity}');
            new IconButton(
              icon: Icons.add,
              onPress: () {
                setState(() {
                  this.quantity++;
                }
                );
              }
            ),

          ],
      ),
    );
  }

}

