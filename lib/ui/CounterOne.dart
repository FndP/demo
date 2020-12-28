import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../UtilsData.dart';

class CounterOne extends StatefulWidget {
  CounterOne({this.counterIndex});

  int counterIndex;

  @override
  _CounterOneState createState() => _CounterOneState();
}

class _CounterOneState extends State<CounterOne> {


  @override
  Widget build(BuildContext context) {

    Provider.of<UtilsData>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Your Counter ${widget.counterIndex}',
          ),
          Text(
            '${
                widget.counterIndex == 1?Provider.of<UtilsData>(context, listen: true).counterValue :
                widget.counterIndex == 2?Provider.of<UtilsData>(context, listen: true).counterValue2 :
                Provider.of<UtilsData>(context, listen: true).counterValue3
            }',
            style: Theme.of(context).textTheme.headline4,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                if(widget.counterIndex == 1){
                  Provider.of<UtilsData>(context, listen: false).counterValue++;
                }else if(widget.counterIndex == 2){
                  Provider.of<UtilsData>(context, listen: false).counterValue2++;
                }else if(widget.counterIndex == 3){
                  Provider.of<UtilsData>(context, listen: false).counterValue3++;
                }
              });
            },
            color: Colors.yellowAccent,
            child: Text("Increment me!"),
          )
        ],
      ),
    );
  }
}
