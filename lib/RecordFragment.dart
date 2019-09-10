import 'package:flutter/material.dart';
import './function/getText.dart';
import "./function/getCategories.dart";

import "./class/domain.dart";

class RecordFragment extends StatefulWidget {
  const RecordFragment({Key key}) : super(key: key);

  @override
  _RecordFragmentState createState() => _RecordFragmentState();
}

class _RecordFragmentState extends State<RecordFragment> {
  dynamic text = "abc";
  String dropdownValue;
  List<Domain> domains = [];
  @override
  void initState() {
    super.initState();
    _domainsInit();
  }

  _domainsInit() async {
    List<Domain> cateries = await getCategories();
    setState(() {
      domains = cateries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                child: Text(text),
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
              )),
          Expanded(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("Lấy văn bản"),
                  onPressed: getData,
                )
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                domains.length != 0
                    ? DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    : Container(),
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.red,
                  padding: EdgeInsets.all(8.0),
                  iconSize: 30,
                  alignment: Alignment.center,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getData() async {
    print(1);
    final resp = await getText();
    setState(() {
      text = resp.text;
    });
  }
}
