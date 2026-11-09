import 'package:flutter/material.dart';

class ChoseMethods extends StatefulWidget{
  const ChoseMethods({super.key});

  @override
  State<ChoseMethods> createState()=> _StateMethods();
}

class _StateMethods extends State<ChoseMethods>{
  List<bool> isChecked = List.generate(3, (index)=>false);
   
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox Radio ListTile Switch Slider Dropdownbutton"),
        titleSpacing: 20,
      ),
      body: Center(
        child: 
        SingleChildScrollView(
          child: Column(
            children: 
              [
                ...allCheckboxes(),
                ...allRadioboxes(),                
              ]                     
          ),
        ),
      ),
    );
  }
  List<Widget> allCheckboxes(){
  return [
    CheckboxListTile(
      value: isChecked[0],
      title: Text("Bu birinchi checkboxlisttile"),
      subtitle: Text("birinchi"), 
      onChanged: (v){
        setState(() {
          isChecked[0] = v!;
        });      
      }),      
    CheckboxListTile(
      value: isChecked[1],
      title: Text("Bu ikkinchi checkboxlisttile"),
      subtitle: Text("ikkinchi"), 
      onChanged: (v){
        setState(() {
          isChecked[1] = v!;
        });
      }),      
    CheckboxListTile(
      value: isChecked[2],
      title: Text("Bu uchinchi checkboxlisttile"),  
      subtitle: Text("uchinchi"),
      onChanged: (v){
        setState(() {
          isChecked[2] = v!;
        });
      }),      
  ];
}
}

List<Widget> allRadioboxes(){
  return [];
}
