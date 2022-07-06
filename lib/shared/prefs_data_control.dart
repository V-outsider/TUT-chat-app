import 'package:shared_preferences/shared_preferences.dart';

int userId = 0;

Future<void> addIdToSF(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('id', id);
  userId = id;
}

Future<int?> getIdFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? intValue = prefs.getInt('id');
  userId = intValue ?? 0;
  return intValue;
}
