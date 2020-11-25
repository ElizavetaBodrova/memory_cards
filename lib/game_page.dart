import 'package:flutter/material.dart';
import 'package:memory_cards/CardModel.dart';
import 'package:memory_cards/flip_card.dart';
import 'package:memory_cards/game.dart';

int axes;
String selectedColor = "";
int selectedIndex;

bool selected = true;
int points = 0;

List<CardModel> myPairs = new List<CardModel>();

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  int maxPoints;
  Game game;
  List<CardModel> cards = new List<CardModel>();
  List<CardModel> questionPairs = new List<CardModel>();

  @override
  void initState() {
    super.initState();
    reStart();
  }

  void reStart() {
    game = Game(area: axes);
    maxPoints = game.getMax();
    myPairs = game.createPairs();
    myPairs.shuffle();

    cards = myPairs;
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        questionPairs = game.createQuestions();
        cards = questionPairs;
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              if (points != maxPoints)
                GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: axes,
                  children: List.generate(axes * axes, (index) {
                    return flipCard(
                      color: cards[index].getColor(),
                      index: index,
                      parent: this,
                    );
                  }),
                )
              else
                Container(
                  child:Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("CONGRATULATION!"),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              axes = 0;
                              Navigator.pushNamed(context, '/');
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 200,
                            alignment: Alignment.center,
                            child: Text(
                              "Replay",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
