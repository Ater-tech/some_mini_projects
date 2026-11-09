import 'package:flutter/material.dart';

class ThisCustomScrollView extends StatelessWidget{
  const ThisCustomScrollView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text("Grow up"),
            centerTitle: true,
            automaticallyImplyLeading: true,
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.ad_units)),
            flexibleSpace: FlexibleSpaceBar(
              title: (Text("sss")),
              background: Image.network(
                "https://picsum.photos/1200/1200?random",
                fit: BoxFit.cover,
                ),
            ),
              actions: [Icon(Icons.book_online)],
              backgroundColor: Colors.blueAccent,
              expandedHeight: MediaQuery.sizeOf(context).height*0.4,
              scrolledUnderElevation: 2.1,
              floating: true,
              snap: true,
              pinned: false,
              // stretch: true,
              // stretchTriggerOffset: 150, 
              // onStretchTrigger: () async {Text("Ok");},
              // foregroundColor: Colors.blueGrey,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20,),),
          SliverList.builder(          
            itemBuilder: (context, index)=> Card(            
              color: Colors.blueAccent[100*(index%9)],
              child: SizedBox(              
                height: MediaQuery.sizeOf(context).height*0.1,
                child: Text(
                  "This is SilverList item $index", 
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  )),
              ),
            itemCount: 15,
            ),
        ],
      ),
    );
  }
}