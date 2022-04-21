import 'package:flutter/material.dart';
import 'package:mathpuzzle/levelpage1.dart';
import 'package:mathpuzzle/secondpg.dart';
import 'package:mathpuzzle/shareclass.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list.dart';
import 'menu.dart';

void main() {
  runApp(MaterialApp(
    home: menu(),
  ));
}

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int? level;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Gets();
  }

  Gets() async {
    Model.statuslist.clear();
    Model.prefs = await SharedPreferences.getInstance();
    level = Model.prefs!.getInt("level") ?? 0;
    setState(() {
      Model.status = true;
    });

    for (int i = 0; i < 75; i++) {
      String levelstatus = Model.prefs!.getString("status$i") ?? "pending";
      Model.statuslist.add(levelstatus);
      print(Model.statuslist);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double theheight = MediaQuery.of(context).size.height;
    double thewidth = MediaQuery.of(context).size.width;
    double statusbarheight = MediaQuery.of(context).padding.top;
    double navigatorbarheight = MediaQuery.of(context).padding.bottom;
    double appbarheight = kToolbarHeight;
    double bodyheight = theheight - statusbarheight - navigatorbarheight;

    return Model.status
        ? Scaffold(
            body: SafeArea(
            child: Container(
              height: theheight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/background.jpg"),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Container(
                    height: theheight * 0.25,
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, bodyheight * 0.01, 0, 0),
                    child: Text(
                      "Math Puzzles",
                      // textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: theheight * 0.06,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Container(
                    height: theheight * 0.5,
                    width: double.infinity,
                    margin: EdgeInsets.all(bodyheight * .05),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/blackboard_main_menu.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return secpg(level!);
                                },
                              ));
                            },
                            child: Text("CONTINUE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontSize: bodyheight * 0.05)),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return levelpage1();
                                },
                              ));
                            },
                            child: Text("PUZZLES",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    fontSize: bodyheight * 0.05)),
                          ),
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "BUY PRO",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: bodyheight * 0.05),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: theheight * 0.01,
                        // margin: EdgeInsets.fromLTRB(0, 0, bodyheight * 0.2, 0),
                        child: Icon(
                          Icons.share,
                          // size: bodyheight * .05,
                        ),
                      ),
                      Container(
                        height: theheight * 0.01,
                        margin: EdgeInsets.fromLTRB(0, 0, bodyheight * 0.02, 0),
                        child: Icon(
                          Icons.email,
                          // size: bodyheight * .05,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: theheight * 0.05,
                        margin: EdgeInsets.fromLTRB(
                            0, bodyheight * .02, bodyheight * .01, 0),
                        child: TextButton(
                            onPressed: () {}, child: Text("Privacy Policy")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ))
        : Center(child: CircularProgressIndicator());
  }
}
