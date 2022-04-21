import 'package:flutter/material.dart';
import 'package:mathpuzzle/main.dart';
import 'package:mathpuzzle/secondpg.dart';

class wining extends StatefulWidget {
  int level;

  wining(this.level);

  @override
  _winingState createState() => _winingState();
}

class _winingState extends State<wining> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // margin: EdgeInsets.only(top: bodyheight * 0.05),
              height: bodyheight * 0.1,
              width: double.infinity,
              child: Text(
                "PUZZLE ${widget.level} COMPLETED",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: bodyheight * 0.03,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              height: bodyheight * 0.3,
              width: double.infinity,
              child: Image.asset("image/trophy.png"),
            ),
            Container(
              height: bodyheight * 0.3,
              child: Column(
                children: [
                  Container(
                    height: bodyheight * 0.05,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return secpg(widget.level);
                              },
                            ));
                          });
                        },
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                  ),
                  SizedBox(
                    height: bodyheight * 0.03,
                  ),
                  Container(
                    height: bodyheight * 0.05,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return firstpage();
                            },
                          ));
                        },
                        child: Text("MAIN MENU",
                            style: TextStyle(fontStyle: FontStyle.italic))),
                  ),
                  SizedBox(
                    height: bodyheight * 0.03,
                  ),
                  Container(
                    height: bodyheight * 0.05,
                    child: Text(
                      "SHARE THIS PUZZLE",
                      style: TextStyle(
                          fontSize: bodyheight * 0.03,
                          color: Colors.blue,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: bodyheight * 0.05,
                      child: Icon(Icons.share),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
