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

  List<Widget> dealerCards = [];
  List<String> dealerCardVals = [];
  int dealerScore = 0;

  List<Widget> playerCards = [];
  List<String> playerCardVals = [];
  int playerScore = 0;

  String gameStatus = "";

  int calculateScore(List<String> hand) {
    int score = 0;
    bool hasAce = false;
    for (var i = 0; i < hand.length; i++) {
      if (hand[i] == "A") {
        hasAce = true;
      } else {
        if (hand[i] != "K" && hand[i] != "Q" && hand[i] != "J") {
          score += int.parse(hand[i]);
        } else {
          score += 10;
        }
      }
      if (hasAce) {
        if (score + 11 > 21) {
          score += 1;
        } else {
          score += 11;
        }
      }
    }
    return score;
  }

  void printStatus() {}

  @override
  void initState() {
    super.initState();
    deck.shuffle();
    dealerCardVals.add(deck.last);
    dealerCards.add(BlackJackCard(cardValue: deck.last));
    deck.removeLast();
    playerCardVals.add(deck.last);
    playerCards.add(BlackJackCard(cardValue: deck.last));
    deck.removeLast();

    playerScore = calculateScore(playerCardVals);
    dealerScore = calculateScore(dealerCardVals);
  }

  @override
  Widget build(BuildContext context) {
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
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dealerCards.length,
              itemBuilder: (context, index) =>
                  Center(child: dealerCards[index]),
            )),
            Text("Dealer Score: $dealerScore"),
            const SizedBox(height: 10),
            const Text("Player Cards:"),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: playerCards.length,
              itemBuilder: (context, index) =>
                  Center(child: playerCards[index]),
            )),
            Text("Player Score: $playerScore"),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 112, 109, 109))))),
                onPressed: (() {
                  // If player hasn't already bust, let them hit
                  if (calculateScore(playerCardVals) <= 21) {
                    // Draw Card
                    setState(() {
                      playerCardVals.add(deck.last);
                      playerCards.add(BlackJackCard(cardValue: deck.last));
                      deck.removeLast();
                      playerScore = calculateScore(playerCardVals);
                    });

                    if (calculateScore(playerCardVals) > 21) {
                      setState(() {
                        gameStatus = "You Busted!";
                      });
                    }
                  }
                }),
                child: const Text("Hit"),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 112, 109, 109))))),
                onPressed: (() {
                  if (calculateScore(playerCardVals) <= 21 &&
                      calculateScore(dealerCardVals) <= 17) {
                    while (calculateScore(dealerCardVals) < 17) {
                      dealerCardVals.add(deck.last);
                      dealerCards.add(BlackJackCard(cardValue: deck.last));
                      deck.removeLast();
                    }
                    dealerScore = calculateScore(dealerCardVals);
                    if (dealerScore > playerScore && dealerScore <= 21) {
                      setState(() {
                        gameStatus = "You Lost!";
                      });
                    } else if (dealerScore < playerScore || dealerScore > 21) {
                      setState(() {
                        gameStatus = "You Won!";
                      });
                    } else {
                      setState(() {
                        gameStatus = "You tied!";
                      });
                    }
                  }
                }),
                child: const Text("Stay"),
              ),
              const SizedBox(width: 10),
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 112, 109, 109))))),
                onPressed: (() {
                  setState(() {
                    deck = [
                      "2",
                      "3",
                      "4",
                      "5",
                      "6",
                      "7",
                      "8",
                      "9",
                      "10",
                      "J",
                      "Q",
                      "K",
                      "A"
                    ];
                    deck.shuffle();

                    dealerCards = [];
                    dealerCardVals = [];
                    dealerScore = 0;

                    playerCards = [];
                    playerCardVals = [];
                    playerScore = 0;

                    gameStatus = "";

                    deck.shuffle();
                    dealerCardVals.add(deck.last);
                    dealerCards.add(BlackJackCard(cardValue: deck.last));
                    deck.removeLast();
                    playerCardVals.add(deck.last);
                    playerCards.add(BlackJackCard(cardValue: deck.last));
                    deck.removeLast();

                    playerScore = calculateScore(playerCardVals);
                    dealerScore = calculateScore(dealerCardVals);
                  });
                }),
                child: const Text("Play Again / Reset"),
              )
            ]),
            Text(gameStatus),
            const SizedBox(height: 150),
          ],
        )));
  }
}

class BlackJackCard extends StatelessWidget {
  final String cardValue;
  const BlackJackCard({super.key, required this.cardValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 60,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        margin: const EdgeInsets.all(5),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(cardValue),
          ],
        )));
  }
}
