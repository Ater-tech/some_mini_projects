import 'package:flutter/material.dart';
import 'bosh_sahifa.dart';
import 'underscrollelevation.dart';

class GradientFon extends StatelessWidget{
  const GradientFon({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradientli fon'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purpleAccent, Colors.blueAccent],),
              
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BoshSahifa()));
            }, 
            child: const Text("Bosh sahifaga qaytish")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradientSecond()));
            }, 
            child: const Text("Gradient 2")),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GradientThird()));
            }, 
            child: const Text("Gradient 3")),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UnderScrollEl()),
                );
              }, 
              child: Text("Under scroll elevation")),
        ],)
      ),
    );
  }
}


class GradientSecond extends StatelessWidget{
  const GradientSecond({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Rasmli AppBar", style: TextStyle(color: Colors.amberAccent),),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/back2.jpg'),
            fit: BoxFit.cover,
            )
          ),
        ),
      ),
    );
  }
}


class GradientThird extends StatelessWidget{
  const GradientThird({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          scrolledUnderElevation: 5.0,
          expandedHeight: 200.0,
          floating: true, // pastga tortganda yuqordan appbar chiqishi
          pinned: true, // tepaga yurgizganda yuqorida appbar doim qolishi
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Scroll AppBar"),
            background: Image.asset(
              "assets/images/back2.jpg",
              fit: BoxFit.cover,
              ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text("Element ${index+1}")),
            childCount: 30,
          ),          
        ),
      ],
    ));
  }
}