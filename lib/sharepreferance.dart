import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sharepreferance extends StatefulWidget {
  @override
  _sharepreferanceState createState() => _sharepreferanceState();
}

class _sharepreferanceState extends State<sharepreferance> {
  String a = "";
  String b = "";
  SharedPreferences? prefs;
  TextEditingController p = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Getpreferance();
  }

  Getpreferance() async {
    // Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getString("get") ?? "";

    print(a);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sharepreferance"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Name"),
              controller: p,
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    a = p.text;
                    prefs!.setString("get", a);
                  });
                },
                child: Text("Get Data")),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(width: 1)),
            height: 100,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(a),
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    b = prefs!.getString("get") ?? "";
                    print(b);
                  });
                },
                child: Text("Set Data")),
          )
        ],
      )),
    );
  }
}
