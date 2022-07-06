// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as int?,
      is_deleted: json['is_deleted'] as bool?,
      creation_date: json['creation_date'] as String?,
      chat_id: json['chat_id'] as int?,
      user_id: json['user_id'] as int?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'is_deleted': instance.is_deleted,
      'creation_date': instance.creation_date,
      'chat_id': instance.chat_id,
      'user_id': instance.user_id,
      'text': instance.text,
    };

ChatWithMessages _$ChatWithMessagesFromJson(Map<String, dynamic> json) =>
    ChatWithMessages(
      id: json['id'] as int?,
      is_deleted: json['is_deleted'] as bool?,
      creation_date: json['creation_date'] as String?,
      origin_user_id: json['origin_user_id'] as int?,
      destination_user_id: json['destination_user_id'] as int?,
      destination_user_name: json['destination_user_name'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatWithMessagesToJson(ChatWithMessages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_deleted': instance.is_deleted,
      'creation_date': instance.creation_date,
      'origin_user_id': instance.origin_user_id,
      'destination_user_id': instance.destination_user_id,
      'destination_user_name': instance.destination_user_name,
      'messages': instance.messages,
    };
