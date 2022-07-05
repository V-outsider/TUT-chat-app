// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';
import '/models/chatMessageModel.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 208, 255),
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 5, 255, 161),
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 185, 103, 255),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "Kriss Benwat",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 185, 103, 255)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: Color.fromARGB(255, 185, 103, 255),
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 185, 103, 255),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (messages[index].messageType == "receiver"
                        ? Alignment.topLeft
                        : Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                (messages[index].messageType == "receiver"
                                    ? 35.0
                                    : 25.0)),
                            topRight: Radius.circular(
                                (messages[index].messageType == "receiver"
                                    ? 25.0
                                    : 35.0)),
                            bottomRight: Radius.circular(
                                (messages[index].messageType == "receiver"
                                    ? 27.0
                                    : 2.0)),
                            bottomLeft: Radius.circular(
                                (messages[index].messageType == "receiver"
                                    ? 2.0
                                    : 27.0)),
                          ),
                          color: const Color.fromARGB(255, 185, 103, 255)),
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        messages[index].messageContent,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                color: const Color.fromARGB(255, 5, 255, 161),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Write message...",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 185, 103, 255),
                                fontWeight: FontWeight.bold),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: const Color.fromARGB(255, 185, 103, 255),
                      elevation: 0,
                      child: const Icon(
                        Icons.send,
                        color: Color.fromARGB(255, 5, 255, 161),
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender"),
  ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(
      messageContent: "Is there any thing wrong?", messageType: "sender"),
];
