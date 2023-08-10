import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/providers/AuthProvider.dart';
import 'package:whatsapp/screens/VerificationScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        leading: null,
        title: const Text(
          'Phone Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Consumer<AuthProvider>(builder: (context, provider, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              const Text(
                'Lütfen telefon numaranızı girin',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 300,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: provider.phoneController,
                  autocorrect: false,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    PhoneInputFormatter(),
                  ],
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.trim().length != 16) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.none,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  provider.verifyNumber();
                  // if (provider.phoneController.text.length == 16) {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => const VerificationScreen()));
                  // }
                },
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
