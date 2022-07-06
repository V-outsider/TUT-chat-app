// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import '/widgets/conversationList.dart';
import '../web_sockets/listeners.dart';
import '../serializable/models.dart';
import '../services/chatting.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Create new chat"),
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Input a username'),
              controller: controller,
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await createNewChat(controller.text);
                  },
                  child: const Text("Submit"))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(90, 235, 185, 255),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "TUT chat",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          openDialog();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text("Create new chat"))
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 5, right: 16, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(148, 254, 243, 255),
                    contentPadding: const EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: StreamBuilder(
                stream: chatsChannel.stream,
                builder: (context, snapshot) {
                  var data = [];

                  if (snapshot.hasData) {
                    // ignore: unused_local_variable
                    data = jsonDecode(snapshot.data.toString())
                        .map((i) => ChatWithMessages.fromJson(i))
                        .toList();
                  }

                  return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ConversationList(
                        dest_id: data[index].destination_user_id,
                        name: data.isNotEmpty
                            ? data[index].destination_user_name
                            : "",
                        messageText: "",
                        time: data[index].creation_date!,
                        isMessageRead: false,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
