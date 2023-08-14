import 'package:firebase_auth/firebase_auth.dart';
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
        toolbarHeight: 40,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary,
              ))
        ],
        title: Text(
          'WhatsApp',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
        leading: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
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
            child: SizedBox(
              height: 400,
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
