import 'package:shared_preferences/shared_preferences.dart';

class Model {
  static bool status = false;
  static List<String> statuslist = [];
  static SharedPreferences? prefs;
  static List number = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  static List answer = [
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
    "20",
    "21",
    "22",
    "23",
    "24",
    "25"
  ];
  static String a = "";
  static int i = 0;
  static List hint = [
    "Multiplication",
    "Division",
    "Sum",
    "Minus",
    "Square",
    "Multiplication1",
    "Division1",
    "Sum1",
    "Minus1",
    "Square1",
    "Multiplication2",
    "Division2",
    "Sum2",
    "Minus2",
    "Square2"
  ];
}
