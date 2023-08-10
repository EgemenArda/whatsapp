import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget{
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  Widget buildPinPut() {
    return Pinput(
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 40),
        Expanded(child: buildPinPut()),
      ],
    );
  }
}