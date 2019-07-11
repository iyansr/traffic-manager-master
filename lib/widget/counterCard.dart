import 'package:flutter/material.dart';

class CounterCard extends StatefulWidget {
  @override
  _CounterCardState createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int _counterCount = 0;

  void increaseCounter() {
    setState(() {
      _counterCount++;
    });
  }

  void decreaseCounter() {
    setState(() {
      _counterCount--;
    });
  }

  Card cardCounter() {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            width: 165.0,
            height: 35.0,
            // child: Text('Counter 1'),
            child: TextField(
              decoration: InputDecoration(
                hasFloatingPlaceholder: false,
                labelText: 'asdas',
              ),
            ),
            color: Colors.grey,
          ),
          Text(
            '0000',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          SizedBox(
            height: 15.0,
            width: 60.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          FlatButton(
            onPressed: increaseCounter,
            child: Text('$_counterCount',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 15.0,
            width: 60.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.replay),
              ),
              IconButton(
                onPressed: decreaseCounter,
                icon: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      height: 200,
      // width: 130,
      // color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cardCounter(),
              cardCounter(),
              cardCounter(),
              cardCounter(),
              cardCounter(),
              cardCounter(),
            ],
          ),
        ],
      ),
    );
  }
}
