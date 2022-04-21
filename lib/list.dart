import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  List<String> selectedItemValue = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemExtent: 50.0,
                  itemBuilder: (BuildContext context, int index) {
                    for (int i = 0; i < 20; i++) {
                      selectedItemValue.add("NONE");
                    }
                    return DropdownButton(
                      value: selectedItemValue[index].toString(),
                      items: _dropDownItem(),
                      onChanged: <String>(value) {
                        selectedItemValue[index] = value;
                        setState(() {});
                      },
                      hint: Text('Select Gender'),
                    );
                  }),
            )
          ],
        ));
  }
}

List<DropdownMenuItem<String>> _dropDownItem() {
  List<String> ddl = ["NONE", "1 YEAR", "2 YEAR"];
  return ddl
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}
