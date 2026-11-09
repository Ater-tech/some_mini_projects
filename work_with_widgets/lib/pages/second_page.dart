import 'package:flutter/material.dart';

class PageWithColumn extends StatelessWidget{
  //final String message;
  //const PageWithColumn ({super.key, this.message = 'Hello from Second Page!'});
  const PageWithColumn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
            padding: EdgeInsets.all(12.0),
            margin: EdgeInsets.all(12.0),
            color: Colors.lightBlueAccent,
            child: Text('This is first column cell. \nstyle: const TextStyle(fontSize: 12)'
            '\nmargin: EdgeInsets.all(12.0), padding: EdgeInsets.all(12.0) ', 
            style: const TextStyle(fontSize: 12)),
            ),
            Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            color: Colors.deepPurpleAccent,
            child: Text('This is second column cell. \nstyle: const TextStyle(fontSize: 12)'
            '\nmargin: EdgeInsets.all(5.0), padding: EdgeInsets.all(5.0)',
            style: const TextStyle(fontSize: 12)),),
            Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            color: Colors.greenAccent,
              child:
                Text('This is third column cell. \nstyle: const TextStyle(fontSize: 24)'
                '\nmargin: EdgeInsets.all(8.0), padding: EdgeInsets.all(8.0)', 
                style: const TextStyle(fontSize: 12)),
            ),  
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to First Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageWithRow extends StatelessWidget{
  final String message;
  const PageWithRow ({super.key, this.message = 'Hello from Second Page!'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to First Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class PageAvatar extends StatefulWidget {
  const PageAvatar({super.key});

  @override
  State<PageAvatar> createState() => _PageAvatarState();
}

class _PageAvatarState extends State<PageAvatar> {
  int _counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page with Avatar'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
        Text('This is a page with an avatar\n This is just some text for align.center', 
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
        ),
        Padding(padding: const EdgeInsets.all(8.0)),
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/girl2.jpg'),
          //child: const Text('Avatar', style: TextStyle(color: Colors.white)),
        ),
        Padding(padding: const EdgeInsets.all(8.0)),
        Text('You have pressed the button \nthis many times: \n$_counter', textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16)),
          ] 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}

class PageWithListView extends StatefulWidget {
  final List<String> fruits;

  const PageWithListView({super.key, required this.fruits});

  @override
  State<PageWithListView> createState() => _PageWithListViewState();
}

class _PageWithListViewState extends State<PageWithListView> {

late List<String> localFruitList;

String tempFruit = '';

@override
void initState() {
  super.initState();
  localFruitList = widget.fruits.cast<String>();
  // localFruitList = List.from(widget.fruits); that is copy of the list
  // If you want to modify the list without affecting the original one
  // localFruitlist = widget.fruits.cast<String>();
  // This will create a new list that references the same objects
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page with ListView'),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: localFruitList.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(localFruitList[index]), 
            child: Card(
              child: ListTile(
                title: Text(localFruitList[index]),
                leading: const Icon(Icons.task),
                trailing: IconButton( 
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                  
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PictureFruit(fruitname: localFruitList[index])
                          ),
                        );
                  },
                ),
              ),
            ),
            
            onDismissed: (direction) {
              tempFruit = localFruitList[index];
              setState(() {
                localFruitList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$tempFruit dismissed'), duration: Duration(milliseconds: 500),),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text('Add a new fruit'),
              content: TextField( 
                onChanged: (value) {
                  tempFruit = value;
                },
                decoration: const InputDecoration(hintText: 'Enter fruit name'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    tempFruit = '';
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    if (tempFruit.isNotEmpty) {
                      setState(() {
                        localFruitList.add(tempFruit);
                      });
                      Navigator.pop(context);
                    }
                    else {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter a fruit name!')),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          });
        },
        tooltip: 'Add Fruit',
        child: const Icon(
          Icons.add,
          color: Colors.white,
          ),
      ),
    );
  }
}


class PictureFruit extends StatefulWidget {
  
  final String fruitname;

  const PictureFruit({super.key, required this.fruitname});

  @override
  State<PictureFruit> createState() => _PictureFruitState();
}

class _PictureFruitState extends State<PictureFruit> {
  bool pathName = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fruitname.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${widget.fruitname.toLowerCase()}.jpg', width: 200, height: 200,
            errorBuilder: (context, error, stackTrace) {
              if (pathName) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  pathName = false;
                    });
             });
              }
              return Image.asset('assets/sorry.jpg', width: 200, height: 200);
        } 
          ),
          
          const SizedBox(height: 20),
         
          if (pathName) 
            Text('This is a picture of ${widget.fruitname}', style: const TextStyle(fontSize: 18)),      
          if (!pathName) 
            Text('Sorry! ${widget.fruitname.toUpperCase()} image not found!', 
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18)),  
          ],
          
        ),
        
      ),
      
    );
  }
}