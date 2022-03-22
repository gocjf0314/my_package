import 'package:flutter/material.dart';

class ConvertPriceToString extends StatelessWidget{

  int? value;
  double? textScale;
  String? unit;
  TextStyle? textStyle;

  ConvertPriceToString({
    this.value,
    this.textScale = 1.0,
    this.unit,
    this.textStyle,
  });

  String getPriceString(int price) {
    List<String> _valueList = [];
    String _tempValue = price.toString();
    String priceString = '';

    for(int i=0; i < _tempValue.length; ++i){
      priceString += _tempValue[i];
    }
    for(int i =0; i < _tempValue.length; ++i){
      _valueList.add(priceString[i]);
    }

    if(priceString.length > 3){
      for(int index = priceString.length - 3; index > 0; index = index - 3){
        _valueList.insert(index, ',');
      }
      priceString = '';
      for(int index = 0; index < _valueList.length; ++index){
        priceString += _valueList.elementAt(index);
      }
      return priceString;
    }
    return priceString;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${getPriceString(value!)}${unit}',
      style: textStyle,
      textScaleFactor: textScale,
    );
  }
}