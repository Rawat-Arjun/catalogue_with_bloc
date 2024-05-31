import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessful extends StatefulWidget {
  const PaymentSuccessful({super.key});

  @override
  State<PaymentSuccessful> createState() => _PaymentSuccessfulState();
}

class _PaymentSuccessfulState extends State<PaymentSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        LottieBuilder.asset('animation/success.json'),
        const Text(
          'Payment Successfull',
          style: TextStyle(fontSize: 30),
        ),
      ]),
    );
  }
}
