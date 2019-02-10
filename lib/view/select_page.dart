import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectPage extends StatefulWidget{
  SelectPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage>{
  final double _imageSize= 5000.0;

  @override
  Widget build(BuildContext context){
    final double expandedSize = 180.0;
    return Scaffold(
      body: new Row(
        children: <Widget>[
          new Expanded(
            flex:1,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[ 
                new Padding(
                  padding:EdgeInsets.all(19),
                  child: new Text(
                        '이름',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                  ),
                ),
                new Container(height: 8.0),
                new SizedBox(
                  width : expandedSize,
                  height: expandedSize,
                  child: GestureDetector(
                    onTap: _onTaptabbed,
                    child: new Image.asset(
                        'assets/left.png',
                        height: 280,
                        fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ]
            )
          ),
          new Expanded(
            flex:1,
            child: new Card(
              child: new Image.asset(
                'assets/right.jpg',
                fit: BoxFit.fill,
                //width: _imageSize,
                //height: _imageSize,
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
    
    SystemChrome.setEnabledSystemUIOverlays(
      SystemUiOverlay.values
    );
  }

  void _buildCardView(){

  }

  void _onTaptabbed()
  {
    print("tap!");
  }
}