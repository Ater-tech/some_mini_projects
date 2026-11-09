import 'package:flutter/material.dart';
import 'bosh_sahifa.dart';

class AppBarIkki extends StatelessWidget {
  const AppBarIkki({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar xossalari 2'),
        backgroundColor: Color.from(
          alpha: 0.2,
          red: 0.6,
          green: 0.1,
          blue: 0.3,
        ),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(50))),
        //shape: Border(bottom: BorderSide(color: Colors.redAccent, width: 3.0)),
        bottom: PreferredSize(preferredSize: Size.fromHeight(50), child: Container(
          color: Colors.yellowAccent,
          alignment: Alignment.center,
          child: Text("Pastki matn", style: TextStyle(color: Colors.black38, fontSize: 18.0), ),
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BoshSahifa()),
                );
              },
              child: Text(
                'Bosh sahifaga qaytish',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
            ),
            
            Text(
              'Ushbu sahifada men quyidagilardan foydalandim:\n'
              'AppBar(bottom:)\nAppBar(shape:Border())', textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
