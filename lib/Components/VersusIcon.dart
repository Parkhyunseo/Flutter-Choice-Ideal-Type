import 'package:flutter/material.dart';

class VersusIcon extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 60.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(247, 64, 106, 1.0),
        borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
        boxShadow: [
          new BoxShadow(
            color:Colors.black,
            offset:Offset(5, 5)
          )
        ],
      ),
      child : new Text(
        "VS",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3
        )
      )
    ));
  }
}