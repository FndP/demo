import 'package:flutter/material.dart';
import 'package:flutter_app/UtilsData.dart';
import 'package:flutter_app/ui/CounterOne.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<UtilsData>(
            create: (context) => UtilsData(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: "Counter demo",),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                title: Text("Counter 1")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                title: Text("Counter 2")),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                title: Text("Counter 3"))
          ]),
      body: IndexedStack(index: _currentIndex, children: [
        CounterOne(counterIndex: 1),
        CounterOne(counterIndex: 2),
        CounterOne(counterIndex: 3),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          if (_currentIndex == 0) {
            Provider.of<UtilsData>(context, listen: false).counterValue = Provider.of<UtilsData>(context, listen: false).counterValue + 1;
          } else if (_currentIndex == 1) {
            Provider.of<UtilsData>(context, listen: false).counterValue2 = Provider.of<UtilsData>(context, listen: false).counterValue2 + 1;
          } else if (_currentIndex == 2) {
            Provider.of<UtilsData>(context, listen: false).counterValue3 = Provider.of<UtilsData>(context, listen: false).counterValue3 + 1;
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
