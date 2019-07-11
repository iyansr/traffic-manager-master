import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  int counter;
  String counterName;
  CardList({this.counter, this.counterName});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 165.0,
            height: 35.0,
            // child: Text('Counter 1'),
            child: TextField(
              decoration: InputDecoration(
                hasFloatingPlaceholder: false,
                labelText: widget.counterName,
              ),
            ),
            color: Colors.grey,
          ),
          Text(
            widget.counter.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          SizedBox(
            // height: 15.0,
            width: 60.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                widget.counter++;
              });
            },
            // child: Text(widget.counter.toString(),
            //     style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            child: IconTheme(
              child: Icon(Icons.add),
              data: IconThemeData(size: 40),
            ),
          ),
          SizedBox(
            // height: 15.0,
            width: 60.0,
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.counter = 0;
                  });
                },
                icon: Icon(Icons.replay),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.counter--;
                  });
                },
                icon: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
