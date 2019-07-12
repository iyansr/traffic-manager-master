import 'package:flutter/material.dart';

import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DateWidget extends StatefulWidget {
  @override
  _DateWidgetState createState() => _DateWidgetState();
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

class _DateWidgetState extends State<DateWidget> {
  @override
  void initState() {
    super.initState();

    _dateTime = DateTime.parse(initDate);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
      ],
    );
  }
}
