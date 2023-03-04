import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Black Jack',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const BlackJack(),
    );
  }
}

class BlackJack extends StatefulWidget {
  const BlackJack({super.key});

  @override
  State<BlackJack> createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack> {
  var deck = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"];
  List<String> dealerCards = [];
  List<String> playerCards = [];

  @override
  Widget build(BuildContext context) {
    dealerCards.add(deck.first);
    playerCards.add(deck.last);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text("Black Jack")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Dealer Cards:"),
            Expanded(
                child: ListView.builder(
              itemCount: dealerCards.length,
              itemBuilder: (context, index) =>
                  Center(child: Text(dealerCards[index])),
            )),
            const Text("Player Cards:"),
            Expanded(
                child: ListView.builder(
              itemCount: dealerCards.length,
              itemBuilder: (context, index) =>
                  Center(child: Text(playerCards[index])),
            )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                onPressed: (() {}),
                child: const Text("Hit"),
              ),
              TextButton(
                onPressed: (() {}),
                child: const Text("Stay"),
              ),
              TextButton(
                onPressed: (() {}),
                child: const Text("Quit"),
              )
            ])
          ],
        )));
  }
}
