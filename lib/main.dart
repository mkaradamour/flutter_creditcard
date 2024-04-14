import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

//
// Created by Mohanad Damour
//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Credit Card Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cardNumber = '', cardCvv = '', cardHolder = '', cardDate = '';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Credit Card Demo"),
        centerTitle: true,
      ),
      body: Column(children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: cardDate,
          cardHolderName: cardHolder,
          cvvCode: cardCvv,
          showBackView: false,
          onCreditCardWidgetChange: (p0) {},
          isChipVisible: true,
          obscureCardNumber: false,
          obscureCardCvv: false,
          obscureInitialCardNumber: false,
          isHolderNameVisible: true,
          isSwipeGestureEnabled: true,
          cardType: CardType.visa,
          bankName: "Citi bank",
          cardBgColor: Colors.teal,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: CreditCardForm(
                cardNumber: cardNumber,
                expiryDate: cardDate,
                cardHolderName: cardHolder,
                cvvCode: cardCvv,
                onCreditCardModelChange: (value) {
                  setState(() {
                    cardHolder = value.cardHolderName;
                    cardCvv = value.cvvCode;
                    cardDate = value.expiryDate;
                    cardNumber = value.cardNumber;
                  });
                },
                formKey: formKey),
          ),
        )
      ]),
    );
  }
}
