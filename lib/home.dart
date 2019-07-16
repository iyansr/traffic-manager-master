import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:traffic_manager/counterpage.dart';

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

String years = _dateTime != null ? _dateTime.year.toString() : '';
String months =
    _dateTime != null ? _dateTime.month.toString().padLeft(2, '0') : '';
String day = _dateTime != null ? _dateTime.day.toString().padLeft(2, '0') : '';
String hours =
    _dateTime != null ? _dateTime.hour.toString().padLeft(2, '0') : '';
String minutes =
    _dateTime != null ? _dateTime.minute.toString().padLeft(2, '0') : '';
String dateTime = '$day-$month-$years | $hours:$minutes';

class _HomeState extends State<Home> {
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

  String surveyor, location, condition;
  int dropdownValue = 1;

  void fungsiFormValidator() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(dateTime);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CounterPage(
          addCard: dropdownValue,
          conditionName: condition,
          locationName: location,
          surveyorName: surveyor,
          date: dateTime,
        );
      }));
      //print textFormField value
      print('Surveyor: $surveyor');
      print('Location: $location');
      print('Condition: $condition');
    }
    // });
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
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          )
        ],
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
                  TextFormField(
                    onSaved: (values) => surveyor = values,
                    // controller: surveyorController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Form Tidak Boleh Kosong';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Surveyor',
                    ),
                  ),

                  SizedBox(height: 20.0),
                  TextFormField(
                    onSaved: (values) => location = values,
                    // controller: controller,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Form Tidak Boleh Kosong';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                  ),

                  SizedBox(height: 20.0),
                  TextFormField(
                    onSaved: (values) => condition = values,
                    // controller: controller,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Form Tidak Boleh Kosong';
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Condition',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('Counter Count: '),
                  SizedBox(height: 20.0),
                  DropdownButton<int>(
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
                  SizedBox(height: 20.0),

                  // date picker widget
                  // DateWidget(),
                  Column(
                    children: <Widget>[
                      Text('Date : '),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black),
                        ),
                        margin: EdgeInsets.only(top: 24.0, bottom: 40.0),
                        child: DatePickerWidget(
                          minDateTime: DateTime.parse(minDate),
                          maxDateTime: DateTime.parse(maxDate),
                          initialDateTime: DateTime.parse(initDate),
                          dateFormat: dateFormat,
                          pickerTheme: DateTimePickerTheme(
                            showTitle: false,
                            backgroundColor: Colors.white10,
                            cancelTextStyle: TextStyle(color: Colors.grey),
                            confirmTextStyle: TextStyle(color: Colors.black),
                            itemTextStyle: TextStyle(color: Colors.black),
                            pickerHeight: 100.0,
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black),
                        ),
                        margin: EdgeInsets.only(top: 8.0, bottom: 40.0),
                        child: TimePickerWidget(
                          minDateTime: DateTime.parse(minTime),
                          maxDateTime: DateTime.parse(maxTime),
                          initDateTime: DateTime.parse(initTime),
                          dateFormat: timeFormat,
                          pickerTheme: DateTimePickerTheme(
                            pickerHeight: 100.0,
                            showTitle: false,
                            backgroundColor: Colors.transparent,
                          ),
                          onChange: (dateTime, selectedIndex) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                        ),
                      ),
                    ],
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
