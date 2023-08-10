import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/providers/AuthProvider.dart';
import 'package:whatsapp/screens/RegisterScreen.dart';
import 'package:whatsapp/screens/widgets/user_image_picker.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: provider.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // UserImagePicker(
                              //   onPickImage: (File pickedImage) {
                              //     provider.selectedImage = pickedImage;
                              //   },
                              // ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email Address',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@')) {
                                    return 'Please enter a valid email address.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  provider.enteredEmail = value!;
                                },
                              ),
                              // TextFormField(
                              //   validator: (value) {
                              //     if (value == null ||
                              //         value.isEmpty ||
                              //         value.trim().length < 4) {
                              //       return 'Please enter at least 4 characters';
                              //     }
                              //   },
                              //   decoration: const InputDecoration(
                              //     labelText: "Username",
                              //   ),
                              //   enableSuggestions: false,
                              //   onSaved: (value) {
                              //     provider.enteredUsername = value!;
                              //   },
                              // ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().length < 6) {
                                    return 'Password must be at least 6 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  provider.enteredPassword = value!;
                                },
                              ),
                              const SizedBox(height: 12),
                              if (provider.isAuthenticating)
                                const CircularProgressIndicator(),
                              if (!provider.isAuthenticating)
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer),
                                  child: const Text("Sign in"),
                                ),
                              if (!provider.isAuthenticating)
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const AuthScreen()));
                                  },
                                  child: const Text(
                                    "Create an account.",
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
