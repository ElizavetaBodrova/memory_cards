import 'package:flutter/material.dart';
import 'package:memory_cards/CardModel.dart';
import 'package:memory_cards/game_page.dart';

class flipCard extends StatefulWidget {
  String color;
  int index;
  SecondScreenState parent;

  flipCard({this.color, this.index, this.parent});

  @override
  _Card createState() => _Card();
}

class _Card extends State<flipCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          setState(() {
            myPairs[widget.index].setIsSelected(true);
          });
          if (selectedColor != "") {
            selected = true;

            /// testing if the selected cards are same
            if (selectedColor == myPairs[widget.index].getColor()) {
              points = points + 100;

              CardModel model = new CardModel();

              Future.delayed(const Duration(seconds: 2), () {
                print("here 1");
                model.setColor("");
                myPairs[widget.index] = model;
                myPairs[selectedIndex] = model;
                this.widget.parent.setState(() {});
                setState(() {
                  selected = false;
                });
                selectedColor = "";
              });
            } else {
              Future.delayed(const Duration(seconds: 2), () {
                print("here 2");
                this.widget.parent.setState(() {
                  myPairs[widget.index].setIsSelected(false);
                  myPairs[selectedIndex].setIsSelected(false);
                });
                setState(() {
                  selected = false;
                });
              });

              selectedColor = "";
            }
          } else {
            setState(() {
              selectedColor = myPairs[widget.index].getColor();
              selectedIndex = widget.index;
            });
          }
        }
      },
      child: Container(
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          color: myPairs[widget.index].getColor() != ""
              ? hexToColor(myPairs[widget.index].getIsSelected()
              ? myPairs[widget.index].getColor()
              : widget.color)
              :Colors.white10),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
