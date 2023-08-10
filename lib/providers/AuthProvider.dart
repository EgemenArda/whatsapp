import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final _firebase = FirebaseAuth.instance;

  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLogin = true;
  var isAuthenticating = false;
  var enteredEmail = '';
  var enteredPassword = '';

  var enteredUsername = '';
  File? selectedImage;
  void register(context) async {
    formKey.currentState!.save();
    try {
      final userCredential = await _firebase.createUserWithEmailAndPassword(
          email: enteredEmail, password: enteredPassword);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('user-images')
          .child('${userCredential.user!.uid}.jpg');

      await storageRef.putFile(selectedImage!);
      final imageUrl = await storageRef.getDownloadURL();

      FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': enteredUsername,
        'email': enteredEmail,
        'image_url': imageUrl,
      });
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Auth failed.'),
        ),
      );

      isAuthenticating = false;
    }
  }
}
