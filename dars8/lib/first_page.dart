import 'package:dars8/lstview_custom.dart';
import 'package:dars8/lstview_custom2.dart';
import 'package:dars8/toastpub.dart';
import 'package:flutter/material.dart';
import 'object_model.dart';
import 'card_list_tile.dart';
import 'with_adv.dart';
import 'lst_snack_bar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  final List<String> listtitle = [
    "Use my model", "Card(ListTile())", "With AD", "ListView.custom()", 
    "ListView.custom()2", "SnakcBar", "Dialog with fluttertoast"];
  final List<Widget> listwidgets = 
  [CarList(), NameList(), AdList(), LstviewCustom(), 
  LstviewCustom2(), LstSnackBar(), ToastPub()];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Eighth project"),
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu_open_outlined)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.task)),
          IconButton(onPressed: (){}, icon: Icon(Icons.help)),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Card(
          child: SizedBox(
            height: 80, 
            child: Center(
              child: ListTile(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => listwidgets[index])),
                        leading: Icon(Icons.trending_flat),
                        title: Text(listtitle[index]),
                        trailing: Icon(Icons.arrow_forward_ios),),
            ),
        ),),
        itemCount: listtitle.length,
        separatorBuilder: (context, index) => SizedBox(height: MediaQuery.of(context).size.height*.01,),
      ),
    );
  }
}
