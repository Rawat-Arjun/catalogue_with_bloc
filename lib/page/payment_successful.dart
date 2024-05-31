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
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Lottie.asset('animation/success_payment.json'),
        const Text(
          '\$ 0.00',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Payment Successfull',
          style: TextStyle(fontSize: 25),
        ),
      ]),
    );
  }
}
