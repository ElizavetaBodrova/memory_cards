class CardModel{

  String color;
  bool isSelected;

  CardModel({color, isSelected});

  void setColor(String newColor){
    color = newColor;
  }

  String getColor(){
    return color;
  }

  void setIsSelected(bool getIsSelected){
    isSelected = getIsSelected;
  }

  bool getIsSelected(){
    return isSelected;
  }
}