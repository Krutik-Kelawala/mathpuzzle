import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mathpuzzle/secondpg.dart';
import 'package:mathpuzzle/shareclass.dart';

class levelpage1 extends StatefulWidget {
  @override
  _levelpage1State createState() => _levelpage1State();
}

class _levelpage1State extends State<levelpage1> {
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
                image: AssetImage("image/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: bodyheight * 0.1,
              child: Center(
                child: Text(
                  "Select Puzzle",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: bodyheight * 0.03,
                      color: Colors.blue),
                ),
              ),
            ),
            Container(
              height: bodyheight * 0.8,
              child: GridView.builder(
                itemCount: 75,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemBuilder: (context, index) {
                  String levelstatus = Model.statuslist[index];
                  int level = Model.prefs!.getInt("level") ?? 0;

                  if (levelstatus == "clear") {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secpg(index);
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/tick.png"))),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: bodyheight * 0.03),
                          ),
                        ),
                      ),
                    );
                  } else if (levelstatus == "skip") {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return secpg(index);
                          },
                        ));
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            style: TextStyle(fontSize: bodyheight * 0.03),
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (index == level) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return secpg(index);
                            },
                          ));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(fontSize: bodyheight * 0.03),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("image/lock.png"))),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
