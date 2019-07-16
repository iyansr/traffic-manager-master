import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traffic_manager/resultPage.dart';
import 'package:traffic_manager/widget/stopwatch.dart';

class CounterPage extends StatefulWidget {
  int addCard;
  String surveyorName;
  String locationName;
  String conditionName;
  String date;
  CounterPage({
    this.addCard,
    this.conditionName,
    this.surveyorName,
    this.locationName,
    this.date,
  });

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  String formattedTime;
  Stopwatch stopwatch = new Stopwatch();
  String m = "false";

  // bool disabledButton = false;
  void startButtonPressed() {
    setState(() {
      if (stopwatch.isRunning) {
        return null;
      } else {
        stopwatch.start();
      }
    });
  }

  void stopButtonPressed() {
    setState(() {
      formattedTime = TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
      stopwatch.stop();
    });
    Navigator.of(context).pop();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          List<TextEditingController> ctrTextData = listCtrl();
          return ResultPage(
            surveyorName: widget.surveyorName,
            locationName: widget.locationName,
            conditionName: widget.conditionName,
            cardCount: widget.addCard,
            counterName: ctrTextData,
            counterNumber: counter,
            duration: formattedTime,
            resultDate: widget.date,
          );
        },
      ),
    );
  }

  TextEditingController cntr1, cntr2, cntr3, cntr4, cntr5, cntr6;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    cntr1 = new TextEditingController(text: 'Counter 1');
    cntr2 = new TextEditingController(text: 'Counter 2');
    cntr3 = new TextEditingController(text: 'Counter 3');
    cntr4 = new TextEditingController(text: 'Counter 4');
    cntr5 = new TextEditingController(text: 'Counter 5');
    cntr6 = new TextEditingController(text: 'Counter 6');
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  bool getaran = false;
  bool suara = false;

  Card counterCard(
      {void add(),
      void minus(),
      void reset(),
      String labelText,
      String valueCount,
      TextEditingController textController}) {
    return Card(
      child: Column(
        // mainAxisAlignment: MainAxisAlignme,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(0),
            width: 165.0,
            height: 45.0,
            // child: Text('Counter 1'),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hasFloatingPlaceholder: false,
                labelText: labelText,
              ),
            ),
            color: Colors.grey,
          ),
          Text(
            valueCount,
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
            onPressed: add,
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
                onPressed: reset,
                icon: Icon(Icons.replay),
              ),
              IconButton(
                onPressed: minus,
                icon: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row rowText1(String text) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            value: getaran,
            onChanged: (e) {
              setState(() {
                getaran = e;
              });
              print(getaran.toString());
            },
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Row rowText2(String text) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
        Transform.scale(
          scale: 0.9,
          child: Checkbox(
            value: suara,
            onChanged: (e) {
              setState(() {
                suara = e;
              });
              print(suara.toString());
            },
            activeColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  List<String> labelTextList = [
    'Counter 1',
    'Counter 2',
    'Counter 3',
    'Counter 4',
    'Counter 5',
    'Counter 6',
  ];
  List<int> counter = [0, 0, 0, 0, 0, 0];

  // List<String> ctrTextData = list();

  List<TextEditingController> listCtrl() =>
      [cntr1, cntr2, cntr3, cntr4, cntr5, cntr6];

  @override
  Widget build(BuildContext context) {
    List<Widget> cardList = [
      counterCard(
          textController: cntr1,
          valueCount: counter[0].toString(),
          labelText: labelTextList[0],
          add: () {
            setState(() {
              counter[0]++;
            });
          },
          minus: () {
            setState(() {
              counter[0]--;
            });
          },
          reset: () {
            setState(() {
              counter[0] = 0;
            });
          }),
      counterCard(
          textController: cntr2,
          valueCount: counter[1].toString(),
          labelText: labelTextList[1],
          add: () {
            setState(() {
              counter[1]++;
            });
          },
          minus: () {
            setState(() {
              counter[1]--;
            });
          },
          reset: () {
            setState(() {
              counter[1] = 0;
            });
          }),
      counterCard(
          textController: cntr3,
          valueCount: counter[2].toString(),
          labelText: labelTextList[2],
          add: () {
            setState(() {
              counter[2]++;
            });
          },
          minus: () {
            setState(() {
              counter[2]--;
            });
          },
          reset: () {
            setState(() {
              counter[2] = 0;
            });
          }),
      counterCard(
          textController: cntr4,
          valueCount: counter[3].toString(),
          labelText: labelTextList[3],
          add: () {
            setState(() {
              counter[3]++;
            });
          },
          minus: () {
            setState(() {
              counter[3]--;
            });
          },
          reset: () {
            setState(() {
              counter[3] = 0;
            });
          }),
      counterCard(
          textController: cntr5,
          valueCount: counter[4].toString(),
          labelText: labelTextList[4],
          add: () {
            setState(() {
              counter[4]++;
            });
          },
          minus: () {
            setState(() {
              counter[4]--;
            });
          },
          reset: () {
            setState(() {
              counter[4] = 0;
            });
          }),
      counterCard(
          textController: cntr6,
          valueCount: counter[5].toString(),
          labelText: labelTextList[5],
          add: () {
            setState(() {
              counter[5]++;
            });
          },
          minus: () {
            setState(() {
              counter[5]--;
            });
          },
          reset: () {
            setState(() {
              counter[5] = 0;
            });
          }),
    ];

    List<Widget> addCardList = [];

    for (var i = 0; i < widget.addCard; i++) {
      addCardList.add(cardList[i]);
    }

    return Scaffold(
      backgroundColor: Colors.orange.shade50,
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
                      Row(
                        children: <Widget>[
                          rowText1('Vibrate'),
                          rowText2('Sound'),
                        ],
                      ),
                      SizedBox(
                        width: 120.0,
                        height: 40.0,
                        child: Card(
                          child: Center(
                            child: TimerText(
                              stopwatch: stopwatch,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.replay),
                              ),
                              IconButton(
                                onPressed: startButtonPressed,
                                icon: Icon(Icons.play_arrow),
                              ),
                              IconButton(
                                onPressed: stopButtonPressed,
                                icon: Icon(Icons.stop),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18.0),
                  height: 220,
                  // width: 130,
                  // color: Colors.red,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: addCardList,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
