import 'package:flutter/material.dart';

class radiobutton extends StatefulWidget {
  @override
  _radiobuttonState createState() => _radiobuttonState();
}

class _radiobuttonState extends State<radiobutton> {
  String gender = "male";

  bool panipuri = false;
  bool chatpuri = false;
  bool sakpuri = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radiobutton / Checkbox"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Radio(
                value: "male",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text("Male"),
            ],
          ),
          Row(
            children: [
              Radio(
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Text("Female")
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: panipuri,
                onChanged: (value) {
                  setState(() {
                    panipuri = value!;
                  });
                },
              ),
              Text("panipuri"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: chatpuri,
                onChanged: (value) {
                  setState(() {
                    chatpuri = value!;
                  });
                },
              ),
              Text("chatpuri"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: sakpuri,
                onChanged: (value) {
                  setState(() {
                    sakpuri = value!;
                  });
                },
              ),
              Text("sakpuri"),
            ],
          )
        ],
      ),
    );
  }
}
