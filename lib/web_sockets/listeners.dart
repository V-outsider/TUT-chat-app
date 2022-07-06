import 'package:web_socket_channel/web_socket_channel.dart';
import '../shared/prefs_data_control.dart';

final chatsChannel = WebSocketChannel.connect(
  Uri.parse('ws://185.74.7.104:11337/ws_chat?client_id=$userId'),
);
