import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'counterpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime _dateTime;
var date = DateTime.now();
var month = date.month < 10 ? '0${date.month}' : '${date.month}';

String minDate = '2010-05-12';
String maxDate = '2021-11-25';
String initDate = '${date.year}-$month-${date.day}';
String dateFormat = 'dd|MM,yyyy';

String minTime = '2010-05-12 00:01:10';
String maxTime = '2021-11-25 23:59:10';
String initTime = '$date';
String timeFormat = 'HH:mm';

class _HomeState extends State<Home> {
  TextEditingController sureyorController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Set portrait orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    _dateTime = DateTime.parse(initDate);
  }

  int dropdownValue = 1;

  void fungsiFormValidator() {
    setState(() {
      if (_formKey.currentState.validate()) {
        // If the form is valid, display a Snackbar.
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CounterPage(addCard: dropdownValue);
        }));
      }
    });
  }

  TextFormField textField({String labelText}) {
    return TextFormField(
      controller: sureyorController,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Form Tidak Boleh Kosong';
        }
      },
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
            child: Form(
              key: _formKey,
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
                        child: textField(labelText: 'Condition'),
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
                      minDateTime: DateTime.parse(minDate),
                      maxDateTime: DateTime.parse(maxDate),
                      initialDateTime: DateTime.parse(initDate),
                      dateFormat: dateFormat,
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
                      minDateTime: DateTime.parse(minTime),
                      maxDateTime: DateTime.parse(maxTime),
                      initDateTime: DateTime.parse(initTime),
                      dateFormat: timeFormat,
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
                      onPressed: fungsiFormValidator,
                      child: Icon(
                        Icons.check,
                        size: 50.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
