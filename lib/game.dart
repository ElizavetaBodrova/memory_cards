import "dart:math";
import 'package:memory_cards/CardModel.dart';

class Game {
  int _maxPoints = 0;
  int area;
  Random random = new Random();

  Game({this.area});

  List<CardModel> myPairs = new List<CardModel>();
  List<String> colors = new List<String>();

  List<String> generateColors(int area) {
    int max = data.length, index = random.nextInt(max);
    for (int i = 0; i < (area * area) / 2; i++) {
      if (index + i >= data.length) {
        index = 0;
      }
      colors.add(data[index]);
      index++;
    }

    return colors;
  }

  List<CardModel> createPairs() {
    colors=generateColors(area);
    for (int i = 0; i < (area * area) / 2; i++) {
      CardModel cardModel = new CardModel();
      print(colors[i]);
      cardModel.setColor(colors[i]);
      cardModel.setIsSelected(false);
      print(cardModel.getColor());
      myPairs.add(cardModel);
      myPairs.add(cardModel);
    }


    return myPairs;
  }

  int getMax() {
    _maxPoints = area * 50 * area;

    return _maxPoints;
  }

  List<CardModel> createQuestions() {
    List<CardModel> myPairs = new List<CardModel>();
    String colorQuestion = "#808080";
    for (int i = 0; i < (area * area) / 2; i++) {
      CardModel model = new CardModel();
      model.setColor(colorQuestion);
      model.setIsSelected(false);
      myPairs.add(model);
      myPairs.add(model);
    }
    return myPairs;
  }

  List<CardModel> getPair() {
    return myPairs;
  }
}

List<String> data = [
  "#CD5C5C",
  "#FFA07A",
  "#FFA07A",
  "#8B0000",
  "#FFC0CB",
  "#FF69B4",
  "#FF1493",
  "#C71585",
  "#FF4500",
  "#FFA500",
  "#FF6347",
  "#FFFF00",
  "#FFDAB9",
  "#E6E6FA",
  "#EE82EE",
  "#9370DB",
  "#8A2BE2",
  "#4B0082",
  "#483D8B",
  "#B8860B",
  "#D2691E",
  "#8B4513",
  "#A52A2A",
  "#800000",
  "#ADFF2F",
  "#00FA9A",
  "#006400",
  "#808000",
  "#556B2F",
  "#66CDAA",
  "#00FFFF",
  "#E0FFFF",
  "#4682B4",
  "#87CEEB",
  "#00BFFF",
  "#7B68EE",
  "#191970",
  "#00008B",
  "#2F4F4F",
];
