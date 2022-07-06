// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class User {
  final int? id;
  final String? username, password;

  User({this.id, this.username, this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Message {
  final int? id;
  // ignore: non_constant_identifier_names
  final bool? is_deleted;
  // ignore: non_constant_identifier_names
  final String? creation_date;
  // ignore: non_constant_identifier_names
  final int? chat_id;
  // ignore: non_constant_identifier_names
  final int? user_id;
  final String? text;

  Message(
      {this.id,
      // ignore: non_constant_identifier_names
      this.is_deleted,
      // ignore: non_constant_identifier_names
      this.creation_date,
      // ignore: non_constant_identifier_names
      this.chat_id,
      // ignore: non_constant_identifier_names
      this.user_id,
      this.text});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class ChatWithMessages {
  final int? id;
  // ignore: non_constant_identifier_names
  final bool? is_deleted;
  // ignore: non_constant_identifier_names
  final String? creation_date;
  // ignore: non_constant_identifier_names
  final int? origin_user_id;
  // ignore: non_constant_identifier_names
  final int? destination_user_id;
  // ignore: non_constant_identifier_names
  final String destination_user_name;
  final List<Message> messages;

  ChatWithMessages(
      {this.id,
      // ignore: non_constant_identifier_names
      this.is_deleted,
      // ignore: non_constant_identifier_names
      this.creation_date,
      // ignore: non_constant_identifier_names
      this.origin_user_id,
      // ignore: non_constant_identifier_names
      this.destination_user_id,
      // ignore: non_constant_identifier_names
      required this.destination_user_name,
      required this.messages});

  factory ChatWithMessages.fromJson(Map<String, dynamic> json) =>
      _$ChatWithMessagesFromJson(json);
  Map<String, dynamic> toJson() => _$ChatWithMessagesToJson(this);
}
