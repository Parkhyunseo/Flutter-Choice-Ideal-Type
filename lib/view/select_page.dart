import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectPage extends StatefulWidget{
  SelectPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Row(
        children: <Widget>[
          new Expanded(
            flex:1,
            child: new Card(
              child: new Image.asset(
                'assets/left.png',
                fit: BoxFit.cover,
                //height: _imageHeight,
                ),
            ),
          ),
          new Expanded(
            flex:1,
            child: new Card(
              child: new Image.asset(
                'assets/right.jpg',
                fit: BoxFit.cover
                ),
            ),
          ),
        ],
      )
    );
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void _buildCardView(){

  }
}