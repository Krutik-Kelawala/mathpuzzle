import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class menu extends StatefulWidget {
  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  List menubar = ["Panipuri", "Vadapav", "Alopuri", "Pakoda", "bread"];
  List price = ["20", "15", "25", "30", "50"];
  List plate = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20"
  ];

  // List<DropdownMenuItem> items() {
  //   List<DropdownMenuItem> id = <DropdownMenuItem>[];
  //
  //   for (int i = 0; i < plate.length; i++) {
  //     id.add(DropdownMenuItem(
  //       child: Center(child: Text(plate[i])),
  //       value: plate[i],
  //     ));
  //   }
  //   return id;
  // }

  List<bool> statusmenu = [false, false, false, false, false];

  // int? val;

  // String? dropdownValue;
  List<String> selectedItemValue = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    storagepermission();
    _createFolder();
  }

  Future<void> storagepermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      await [
        Permission.storage,
      ].request();
    }
  }

  GlobalKey globalKey = GlobalKey();
  String folderpath = "";

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  _createFolder() async {
    final folderName = "Screenshot";
    final path1 = Directory("storage/emulated/0/DCIM/$folderName");
    if ((await path1.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path1.create();
    }
    folderpath = path1.path;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: RepaintBoundary(
          key: globalKey,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text("Items"),
                      ),
                      Container(
                        child: Text("Rs"),
                      ),
                      Container(
                        child: Text("Plate"),
                      ),
                      Container(
                        child: Text("Select"),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: menubar.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      for (int i = 1; i < 20; i++) {
                        selectedItemValue.add("1");
                      }
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("${menubar[index]}"),
                            Text("${price[index]}"),
                            // DropdownButton(
                            //   hint: Text("Select"),
                            //   value: dropdownValue,
                            //   items: items(),
                            //   onChanged: <String>(value) {
                            //     setState(() {
                            //       dropdownValue = value;
                            //     });
                            //   },
                            // ),
                            DropdownButton(
                              value: selectedItemValue[index].toString(),
                              items: dropDownItem(),
                              onChanged: <String>(value) {
                                selectedItemValue[index] = value;
                                setState(() {});
                              },
                              hint: Text('Select'),
                            ),
                            Checkbox(
                              value: statusmenu[index],
                              onChanged: (value) {
                                setState(() {
                                  statusmenu[index] = value!;
                                  getmyvalue(statusmenu[index], price[index],
                                      selectedItemValue[index]);
                                });
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text("Total"),
                      ),
                      Container(
                        child: Text("Rs $a /-"),
                      )
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      _capturePng().then((value) async {
                        print(value);

                        String imagename = "Image${Random().nextInt(1000)}.jpg";
                        String imagepath = "$folderpath/$imagename";
                        File ff = File(imagepath);
                        ff.writeAsBytes(value);

                        await ff.create();

                        Share.shareFiles(
                          ['${ff.path}'],
                        );
                      });
                    },
                    child: Icon(Icons.share))
              ],
            ),
          ),
        ));
  }

  int a = 0;

  void getmyvalue(bool status, price, String plate) {
    if (status) {
      setState(() {
        a = a + int.parse(price) * int.parse(plate);
      });
    } else {
      setState(() {
        a = a - int.parse(price) * int.parse(plate);
      });
    }
  }

  List<DropdownMenuItem<String>> dropDownItem() {
    List<String> ddl = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "14",
      "15",
      "16",
      "17",
      "18",
      "19",
      "20"
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ))
        .toList();
  }
}
