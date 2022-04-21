import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mathpuzzle/shareclass.dart';
import 'package:mathpuzzle/winpg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secpg extends StatefulWidget {
  int level;

  secpg(this.level);

  @override
  _secpgState createState() => _secpgState();
}

class _secpgState extends State<secpg> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Getshareprefeance();
  }

  Getshareprefeance() async {
    Model.prefs = await SharedPreferences.getInstance();
    Model.i = Model.prefs!.getInt("getdata") ?? 1;
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

    return Scaffold(
        body: SafeArea(
      child: Container(
        height: bodyheight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/gameplaybackground.jpg"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: bodyheight * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Model.statuslist[widget.level] = "skip";
                        // print(Model.statuslist);
                        Model.prefs!.setString("status${widget.level}", "skip");
                        setState(() {
                          widget.level++;
                        });

                        // print(widget.level);
                        Model.prefs!.setInt("level", widget.level);

                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secpg(widget.level);
                          },
                        ));
                      });
                      // print("abc");

                      ;
                    },
                    child: Container(
                      height: bodyheight * 0.05,
                      child: Image.asset("image/skip.png"),
                    ),
                  ),
                  Container(
                    height: bodyheight * 0.08,
                    width: thewidth * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("image/level_board.png"),
                            fit: BoxFit.fill)),
                    child: Center(
                        child: Text(
                      "Puzzle ${widget.level + 1}",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: bodyheight * 0.03),
                    )),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hint"),
                            content: Text("${Model.hint[Model.i]}"),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Ok"))
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: bodyheight * 0.05,
                      child: Image.asset("image/hint.png"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: bodyheight * 0.5,
              child: Image.asset("image/p${widget.level + 1}.png"),
            ),
            Expanded(child: SizedBox()),
            Container(
              color: Colors.black,
              height: bodyheight * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: bodyheight * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(Model.a),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          earse();
                        },
                        child: Container(
                          height: bodyheight * 0.05,
                          child: Image.asset("image/delete.png"),
                        ),
                      ),
                      Container(
                        height: bodyheight * 0.05,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () {
                              if (Model.a == Model.answer[widget.level]) {
                                String levelstatus =
                                    Model.statuslist[widget.level];
                                if (levelstatus == "clear") {
                                  Model.prefs!.setInt("level", widget.level);
                                  Model.a = "";
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return wining(widget.level + 1);
                                    },
                                  ));
                                } else if (levelstatus == "skip") {
                                  Model.statuslist[widget.level] = "clear";

                                  Model.prefs!.setString(
                                      "status${widget.level}", "clear");
                                  // Model.prefs!.setInt("level", widget.level);

                                  Model.a = "";
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return wining(widget.level + 1);
                                    },
                                  ));
                                } else {
                                  setState(() {
                                    Model.statuslist[widget.level] = "clear";

                                    Model.prefs!.setString(
                                        "status${widget.level}", "clear");
                                    widget.level++;
                                    Model.prefs!.setInt("level", widget.level);

                                    Model.a = "";
                                  });
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return wining(widget.level);
                                    },
                                  ));
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Wrong Answer",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              // print(widget.level);
                              // print(Model.statuslist);
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                  Container(
                    height: bodyheight * 0.1,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Model.number.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Model.a = "${Model.a}" + "${Model.number[index]}";
                            });
                          },
                          child: Container(
                            width: thewidth * 0.065,
                            margin: EdgeInsets.all(bodyheight * 0.01),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            child: Center(
                              child: Text(
                                "${Model.number[index]}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bodyheight * 0.04),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void earse() {
    setState(() {
      Model.a = Model.a.substring(0, Model.a.length - 1);
    });
  }
}
