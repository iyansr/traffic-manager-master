import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  String surveyorName;
  String locationName;
  String conditionName;
  List<TextEditingController> counterName;
  List<int> counterNumber;
  int cardCount;
  String duration;
  String resultDate;
  ResultPage({
    this.duration,
    this.surveyorName,
    this.conditionName,
    this.locationName,
    this.cardCount,
    this.counterName,
    this.counterNumber,
    this.resultDate,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ListTile listTile({String title, Icon icon, String subtitle}) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Card resultPageCard({String title, String subtitle}) {
    return Card(
      child: SizedBox(
        // height: 100,
        width: 150,
        child: ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Icon(Icons.home),
          title: Text(title),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> resultCard = [
      resultPageCard(
        title: widget.counterName[0].text,
        subtitle: widget.counterNumber[0].toString(),
      ),
      resultPageCard(
        title: widget.counterName[1].text,
        subtitle: widget.counterNumber[1].toString(),
      ),
      resultPageCard(
        title: widget.counterName[2].text,
        subtitle: widget.counterNumber[2].toString(),
      ),
      resultPageCard(
        title: widget.counterName[3].text,
        subtitle: widget.counterNumber[3].toString(),
      ),
      resultPageCard(
        title: widget.counterName[4].text,
        subtitle: widget.counterNumber[4].toString(),
      ),
      resultPageCard(
        title: widget.counterName[5].text,
        subtitle: widget.counterNumber[5].toString(),
      ),
    ];

    List<Widget> displayResult = [];

    for (var i = 0; i < widget.cardCount; i++) {
      displayResult.add(resultCard[i]);
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
            color: Colors.black,
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Result Page',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0.0,
      ),
      body: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          Container(
              child: Column(
            children: <Widget>[
              listTile(
                icon: Icon(Icons.calendar_today, color: Colors.black),
                title: 'Date',
                subtitle: '${widget.resultDate}',
              ),
              listTile(
                icon: Icon(Icons.person, color: Colors.black),
                title: 'Surveyor',
                subtitle: '${widget.surveyorName}',
              ),
              listTile(
                icon: Icon(Icons.room, color: Colors.black),
                title: 'Location',
                subtitle: '${widget.locationName}',
              ),
              listTile(
                icon: Icon(Icons.cloud, color: Colors.black),
                title: 'Condtition',
                subtitle: '${widget.conditionName}',
              ),
              listTile(
                icon: Icon(Icons.query_builder, color: Colors.black),
                title: 'Duration',
                subtitle: '${widget.duration}',
              ),
              Wrap(
                children: displayResult,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
