import 'package:shared_preferences/shared_preferences.dart';

Future<void> addIdToSF(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('id', id);
}

Future<int?> getIdFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? intValue = prefs.getInt('id');
  return intValue;
}
