import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/providers/AuthProvider.dart';

class ChatSelectScreen extends StatefulWidget {
  const ChatSelectScreen({super.key});

  @override
  State<ChatSelectScreen> createState() => _ChatSelectScreenState();
}

class _ChatSelectScreenState extends State<ChatSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        centerTitle: true,
        title: const Text('WhatsApp'),
        leading: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Sohbetler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular_outlined),
            label: 'Durum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Topluluklar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Aramalar',
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (provider, context, child) {
          return SingleChildScrollView(
            child: Expanded(
              child: ListView.builder(
                itemCount: 999,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {}, //her biri için fonksiyon
                    child: ListTile(
                      // leading: CircleAvatar(backgroundImage: ), buraya image çakarsın
                      title: Text('Her bir sohbet'),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
