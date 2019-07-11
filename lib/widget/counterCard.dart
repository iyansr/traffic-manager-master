import 'package:flutter/material.dart';
import 'cardList.dart';

class CounterCard extends StatefulWidget {
  int addcard;
  CounterCard({this.addcard});
  @override
  _CounterCardState createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  List<CardList> cardlist = [
    CardList(counter: 0, counterName: 'Counter 1'),
    CardList(counter: 0, counterName: 'Counter 1'),
    CardList(counter: 0, counterName: 'Counter 1'),
    CardList(counter: 0, counterName: 'Counter 1'),
    CardList(counter: 0, counterName: 'Counter 1'),
    CardList(counter: 0, counterName: 'Counter 1'),
  ];

  List<CardList> displayCard = [];

  void ulang() {
    int v = widget.addcard;
    for (var i = 0; i < v; i++) {
      displayCard.add(cardlist[i]);
    }
  }

// void card(){
//   displayCard.map(cardlist).toList();
// }
  @override
  void initState() {
    super.initState();
    ulang();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      height: 230,
      // width: 130,
      // color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: displayCard,
          ),
        ],
      ),
    );
  }
}
