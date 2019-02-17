import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ideal_type/data/content.dart';

class SelectPage extends StatefulWidget{
  SelectPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectPageState();
}

enum _SelectAnimationStatus { stay, select, discard, animating }

class _SelectPageState extends State<SelectPage>
  with TickerProviderStateMixin{

  AnimationController leftCardSelectanimationController;
  AnimationController leftCardDiscardanimationController;
  AnimationController rightCardSelectanimationController;
  AnimationController rightCardDiscardanimationController;

  AnimationController rightCardMatchanimationController;
  AnimationController leftCardMatchanimationController;

  Animation<double> selectedLeftCardAnimation;
  Animation<double> selectedRightCardAnimation;
  Animation<double> discardedLeftCardAnimation;
  Animation<double> discardedRightCardAnimation;

  Animation<double> matchLeftCardAnimation;
  Animation<double> matchRightCardAnimation;

  _SelectAnimationStatus leftCardStatus;
  _SelectAnimationStatus rightCardStatus;

  @override
  void initState() {
    super.initState();

    leftCardSelectanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    leftCardDiscardanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardSelectanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardDiscardanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    leftCardMatchanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardMatchanimationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    )..addListener(
      (){}
    );

    selectedLeftCardAnimation = new Tween(
      begin: 0.0,
      end: 150.0
    ).animate(
      new CurvedAnimation(
        parent: leftCardSelectanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.easeOut,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    selectedRightCardAnimation = new Tween(
      begin: 0.0,
      end: -150.0
    ).animate(
      new CurvedAnimation(
        parent: rightCardSelectanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.easeOut,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    discardedLeftCardAnimation = new Tween(
      begin: 0.0,
      end: -500.0
    ).animate(
      new CurvedAnimation(
        parent: leftCardDiscardanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    discardedRightCardAnimation = new Tween(
      begin: 0.0,
      end: 500.0
    ).animate(
      new CurvedAnimation(
        parent: rightCardDiscardanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    matchLeftCardAnimation = new Tween(
      begin: 0.0,
      end: 500.0
    ).animate(
      new CurvedAnimation(
        parent: rightCardDiscardanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    matchRightCardAnimation = new Tween(
      begin: 0.0,
      end: 500.0
    ).animate(
      new CurvedAnimation(
        parent: rightCardDiscardanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    
    SystemChrome.setEnabledSystemUIOverlays(
      SystemUiOverlay.values
    );
  }

  void _selectAnimation(bool isLeft){
      if(isLeft)
      {
        leftCardStatus = _SelectAnimationStatus.select;
        rightCardStatus = _SelectAnimationStatus.discard;
        leftCardSelectanimationController.forward();
        rightCardDiscardanimationController.forward();
      }
      else
      {
        leftCardStatus = _SelectAnimationStatus.discard;
        rightCardStatus = _SelectAnimationStatus.select;
        rightCardSelectanimationController.forward();
        leftCardDiscardanimationController.forward();
      }
  }

  @override
  Widget build(BuildContext context){
    //final double percent = (_animationController.value * 100.0);
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: new Row(
        children: <Widget>[
          new Expanded(
            flex:1,
            child: _buildCardView(true, screenSize, 0)
          ),
          new Container(
              width: 5,
              // decoration: new BoxDecoration(
              //   color: Colors.black
              // ),
            ),
          new Expanded(
            flex:1,
            child: _buildCardView(false, screenSize, 1)
          ),
        ],
      )
    );
  }
  
  @override
  void dispose() {
    leftCardDiscardanimationController.dispose();
    rightCardDiscardanimationController.dispose();
    leftCardSelectanimationController.dispose();
    rightCardSelectanimationController.dispose();
    super.dispose();
  }

  Widget _buildCardView(bool isLeft, Size screenSize, int index){
    Offset offset;
    if(isLeft)
      offset = Offset(leftCardStatus == _SelectAnimationStatus.select ? 
                selectedLeftCardAnimation.value : discardedLeftCardAnimation.value,
                 0.0);
    else
      offset = Offset(rightCardStatus == _SelectAnimationStatus.select ? 
                selectedRightCardAnimation.value : discardedRightCardAnimation.value, 0.0);

    return GestureDetector(
      onTap: () => _selectAnimation(isLeft),
      child: new Transform.translate(
        offset: offset,
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
                        image: img[index],//new ExactAssetImage('assets/left.png'),
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
                      children: <Widget> [
                        new Text(
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
    );
  }
}