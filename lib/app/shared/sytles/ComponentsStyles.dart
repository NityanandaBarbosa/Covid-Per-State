import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentsStyles {
  //BoxDecoration
  static get backgroundLoginDecoration => BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white70,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      );

  //InputText
  static get inputBorderBlack54 =>
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black54));

  //Container
  static get gradientAppbaContainer => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.yellow, Colors.green])),
      );

  //ButtonStyles
  static get greenButton =>
      ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green));

  //TextStyles
  static get normal15White => TextStyle(
      fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal);
  static get normal20Black => TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal);
  static get normal20Blue => TextStyle(
      fontSize: 20, color: Colors.blue, fontWeight: FontWeight.normal);
  static get regurlar13Black => TextStyle(fontSize: 13, color: Colors.black);
}
