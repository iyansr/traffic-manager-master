import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traffic_manager/widget/counterCard.dart';

// import 'counterpage.dart';

class CounterPage extends StatefulWidget {
  int addCard;
  CounterPage({this.addCard});
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  bool value1 = false;
  bool value2 = false;

  void switchOnChange1(bool val1) {
    setState(() {
      value1 = val1;
    });
  }

  void switchOnChange2(bool val2) {
    setState(() {
      value2 = val2;
    });
  }

  Row rowText1(String text, bool values) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            value: values,
            onChanged: (e) => switchOnChange1(e),
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Row rowText2(String text, bool values) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            value: values,
            onChanged: switchOnChange2,
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      rowText1('Vibrate', value1),
                      rowText2('Sound', value2),
                    ],
                  ),
                  ButtonTheme(
                    child: FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.camera,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: 120.0,
                        height: 40.0,
                        child: Card(
                          child: Center(
                            child: Text(
                              '00:00:00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.replay),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.stop),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            CounterCard(addcard: widget.addCard)
          ],
        ),
      ],
    )));
  }
}
