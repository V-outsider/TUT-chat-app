import 'package:http/http.dart' as http;
import '../shared/prefs_data_control.dart';

const endpoint = 'http://185.74.7.104:11337/';

Future<void> createNewChat(String username) async {
  await http.post(Uri.parse(
      '${endpoint}new_chat?current_user_id=${await getIdFromSF()}&username=$username'));
}
