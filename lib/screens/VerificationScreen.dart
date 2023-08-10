import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  TextEditingController pinController = TextEditingController();

  Widget buildPinPut() {
    return Pinput(
      controller: pinController,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      validator: (s) {
        return s == null ? 'Enter a pin' : null;
      },
      showCursor: true,
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget _dialog(BuildContext context, String title, String content) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Okay"))
        ],
      );
    }

    void _scaleDialog(String title, String content) {
      showGeneralDialog(
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
            scale: curve,
            child: _dialog(ctx, title, content),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      );
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildPinPut(),
            const SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: TextButton(
                onPressed: () {
                  if (pinController.text == '2222') {
                    _scaleDialog('Number Verified', 'Phone number successfully verified');
                  } else {
                    _scaleDialog('Wrong Code', 'Phone number did not verified due to wrong code entry, try again!');
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                child: const Text(
                  'Validate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
