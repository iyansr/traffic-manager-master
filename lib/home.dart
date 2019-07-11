import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'counterpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// const now = DateTime.now();

const String MIN_DATETIME = '2010-05-12';
const String MAX_DATETIME = '2021-11-25';
const String INIT_DATETIME = '2021-11-25';
const String DATE_FORMAT = 'dd|MMM,yyyy';

const String MIN_TIME = '2010-05-12 00:01:10';
const String MAX_TIME = '2021-11-25 23:59:10';
const String INIT_TIME = '2019-05-17 18:13:15';
const String TIME_FORMAT = 'HH:mm';

class _HomeState extends State<Home> {
  TextEditingController sureyorController;

  DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    _dateTime = DateTime.parse(INIT_DATETIME);
  }

  int dropdownValue = 1;

  TextField textField({String labelText}) {
    return TextField(
      controller: sureyorController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }

  String dateText = 'Select Date';

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Traffic Manager',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                textField(labelText: 'Surveyor'),
                SizedBox(height: 20.0),
                textField(labelText: 'Location'),
                SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Condition',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      flex: 1,
                      child: Text('Counter Count: '),
                    ),
                    Expanded(
                      flex: 1,
                      child: DropdownButton<int>(
                        value: dropdownValue,
                        onChanged: (int newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <int>[1, 2, 3, 5, 6]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                // date picker widget
                Text('Date : '),
                Container(
                  margin: EdgeInsets.only(top: 24.0, bottom: 40.0),
                  child: DatePickerWidget(
                    minDateTime: DateTime.parse(MIN_DATETIME),
                    maxDateTime: DateTime.parse(MAX_DATETIME),
                    initialDateTime: DateTime.parse(INIT_DATETIME),
                    dateFormat: DATE_FORMAT,
                    pickerTheme: DateTimePickerTheme(
                      showTitle: false,
                      backgroundColor: Colors.white,
                      cancelTextStyle: TextStyle(color: Colors.grey),
                      confirmTextStyle: TextStyle(color: Colors.black),
                      itemTextStyle: TextStyle(color: Colors.black),
                      pickerHeight: 150.0,
                      itemHeight: 30.0,
                    ),
                    onChange: (dateTime, selectedIndex) {
                      setState(() {
                        _dateTime = dateTime;
                      });
                    },
                  ),
                ),
                Text('Time : '),
                // time format input field
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
                  child: TimePickerWidget(
                    minDateTime: DateTime.parse(MIN_TIME),
                    maxDateTime: DateTime.parse(MAX_TIME),
                    initDateTime: DateTime.parse(INIT_TIME),
                    dateFormat: TIME_FORMAT,
                    pickerTheme: DateTimePickerTheme(
                      pickerHeight: 150.0,
                      showTitle: false,
                      backgroundColor: Colors.white,
                    ),
                    onChange: (dateTime, selectedIndex) {
                      setState(() {
                        _dateTime = dateTime;
                      });
                    },
                  ),
                ),

                ButtonTheme(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return CounterPage(addCard: dropdownValue);
                      }));
                    },
                    child: Icon(
                      Icons.check,
                      size: 50.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
