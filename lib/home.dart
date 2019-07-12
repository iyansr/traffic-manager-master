import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traffic_manager/counterpage.dart';
import 'package:traffic_manager/widget/dateWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

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
  }

  String surveyor, location, condition;
  int dropdownValue = 1;

  void fungsiFormValidator() {
    // setState(() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // If the form is valid, go to next page.

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return CounterPage(addCard: dropdownValue);
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
                    // controller: controller,
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
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: TextFormField(
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
                  DateWidget(),

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
