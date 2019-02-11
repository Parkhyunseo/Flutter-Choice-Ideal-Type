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
    final double imageSize = 180.0;
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: new Row(
        children: <Widget>[
          new Expanded(
            flex:1,
            child: GestureDetector(
              onTap: _onTaptabbed,
              child: new Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                //width: MediaQuery.of(context).size.width /3,
                //height: MediaQuery.of(context).size.height,
                child:new Card(
                  color: Colors.transparent,
                  elevation: 4.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                       color: new Color.fromRGBO(242, 194, 203, 1.0),
                       borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child : new Column(
                        children: <Widget>[
                          new Container(
                            width: screenSize.width,
                            height: screenSize.height/1.25,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  topLeft: new Radius.circular(8.0),
                                  topRight: new Radius.circular(8.0)
                              ),
                              image: new DecorationImage(
                                image: new ExactAssetImage('assets/left.png'),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          new Container(
                              width: screenSize.width / 3,
                              height: screenSize.height / 10,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.transparent
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [new Text(
                                  "이름이름",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    ),
                                  ),  
                                ]
                              ),
                            ),
                        ],
                    ),
                  )
                ),
              ),
            )
          ),
          new Container(
              width: 5,
              decoration: new BoxDecoration(
                color: Colors.black
              ),
            ),
          new Expanded(
            flex:1,
            child: GestureDetector(
              onTap: _onTaptabbed,
              child: new Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child:new Card(
                  color: Colors.transparent,
                  elevation: 4.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                       color: new Color.fromRGBO(242, 194, 203, 1.0),
                       borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child : new Column(
                        children: <Widget>[
                          new Container(
                            width: screenSize.width,
                            height: screenSize.height/1.25,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(
                                  topLeft: new Radius.circular(8.0),
                                  topRight: new Radius.circular(8.0)
                              ),
                              image: new DecorationImage(
                                image: new ExactAssetImage('assets/right.jpg'),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          new Container(
                              width: screenSize.width / 3,
                              height: screenSize.height / 10,
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.transparent
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget> [new Text(
                                  "이름이름",
                                  textAlign: TextAlign.center,
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    ),
                                  ),  
                                ]
                              ),
                            ),
                        ],
                    ),
                  )
                ),
              ),
            )
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