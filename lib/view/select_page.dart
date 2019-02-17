import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ideal_type/data/content.dart';

class SelectPage extends StatefulWidget{
  SelectPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectPageState();
}

enum _SelectAnimationStatus { stay, start, select, discard, animating }

class _SelectPageState extends State<SelectPage>
  with TickerProviderStateMixin{

  AnimationController leftCardSelectanimationController;
  AnimationController leftCardDiscardanimationController;
  AnimationController leftCardMatchanimationController;

  AnimationController rightCardSelectanimationController;
  AnimationController rightCardDiscardanimationController;
  AnimationController rightCardMatchanimationController;

  Animation<double> selectedLeftCardAnimation;
  Animation<double> selectedRightCardAnimation;

  Animation<double> discardedLeftCardAnimation;
  Animation<double> discardedRightCardAnimation;

  Animation<double> matchLeftCardAnimation;
  Animation<double> matchRightCardAnimation;

  _SelectAnimationStatus leftCardStatus;
  _SelectAnimationStatus rightCardStatus;

  List temp = [];
  bool select = false;

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
      duration: const Duration(milliseconds: 3000),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardMatchanimationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
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
      begin: 0.0 ,
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
      begin: -500.0,
      end: 0.0,
    ).animate(
      new CurvedAnimation(
        parent: leftCardMatchanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.bounceOut,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    matchRightCardAnimation = new Tween(
      begin: 500.0,
      end: 0.0
    ).animate(
      new CurvedAnimation(
        parent: rightCardMatchanimationController,
        curve:  new Interval(
          0.0,
          0.20,
          curve: Curves.bounceOut,
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

    _next();
  }

  void _reset() {
    leftCardSelectanimationController.reset();
    leftCardDiscardanimationController.reset();
    leftCardMatchanimationController.reset();

    rightCardSelectanimationController.reset();
    rightCardDiscardanimationController.reset();
    rightCardMatchanimationController.reset();
  }
  
  void _next() {    
    if(temp.length != 0)
      img = temp;  
    img.shuffle();
    _startMatch();
  }

  void _selectAnimation(bool isLeft, ExactAssetImage selectImage){
    if(leftCardDiscardanimationController.isAnimating)
      return;
    
    if(leftCardMatchanimationController.isAnimating)
      return;
    
    if(leftCardSelectanimationController.isAnimating)
      return;

    if(rightCardDiscardanimationController.isAnimating)
      return;

    if(rightCardSelectanimationController.isAnimating)
      return;

    if(rightCardMatchanimationController.isAnimating)
      return;

    if(isLeft){
      // TODO :: 조건 교체
      if(select){
        leftCardStatus = _SelectAnimationStatus.discard;
        discardedLeftCardAnimation = 
          new Tween(
              begin: 150.0,
              end: -500.0
            ).animate(
              new CurvedAnimation(
                parent: leftCardDiscardanimationController,
                curve: Curves.linear
              ),
            )..addListener(() {
              setState((){
              });  
            })..addStatusListener((AnimationStatus status){
              if(status == AnimationStatus.completed){
                select = false;
                img.removeAt(0);
                img.removeAt(1);
                print(img.length);
                temp.add(selectImage);
                _startMatch();
              }
          });
        leftCardDiscardanimationController.forward();
      }else{
        select = true;
        leftCardStatus = _SelectAnimationStatus.select;
        rightCardStatus = _SelectAnimationStatus.discard;
        leftCardSelectanimationController.forward();
        rightCardDiscardanimationController.forward();
      }
    }else{
      if(select){
        print('right');
        rightCardStatus = _SelectAnimationStatus.discard;
        discardedRightCardAnimation = 
          new Tween(
              begin: -150.0,
              end: 500.0
            ).animate(
              new CurvedAnimation(
                parent: rightCardDiscardanimationController,
                curve: Curves.linear,
              ),
            )..addListener(() {
              setState((){
              });  
            })..addStatusListener((AnimationStatus status){
              if(status == AnimationStatus.completed){
                select = false;
                img.removeAt(0);
                img.removeAt(1);
                
                temp.add(selectImage);
                _startMatch();
              }
                
            });
        rightCardDiscardanimationController.forward();
      }else{
        select = true;
        leftCardStatus = _SelectAnimationStatus.discard;
        rightCardStatus = _SelectAnimationStatus.select;
        rightCardSelectanimationController.forward();
        leftCardDiscardanimationController.forward();
      }
    }
  }

  double _getOffsetValue(bool isLeft){
    var status = isLeft ? leftCardStatus : rightCardStatus;
    double value = 0.0;

    switch(status){
      case _SelectAnimationStatus.start:
        value = isLeft ? matchLeftCardAnimation.value : matchRightCardAnimation.value;
        break;
      case _SelectAnimationStatus.discard:
        value = isLeft ? discardedLeftCardAnimation.value : discardedRightCardAnimation.value;
        break;
      case _SelectAnimationStatus.select:
        value = isLeft ? selectedLeftCardAnimation.value : selectedRightCardAnimation.value;
        break;
      case _SelectAnimationStatus.animating:
        break;
      case _SelectAnimationStatus.stay:
        break;
    }

    return value;
  }

  Widget _buildCardView(bool isLeft, Size screenSize, int index){
    
    Offset offset = Offset(_getOffsetValue(isLeft), 0.0);

    return GestureDetector(
      onTap: () => _selectAnimation(isLeft, img[index]),
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
    leftCardMatchanimationController.dispose();
    rightCardMatchanimationController.dispose();
    super.dispose();
  }

  void _startMatch(){
    _reset();

    if(img.length <= 0)
      _next();

    leftCardStatus = _SelectAnimationStatus.start;
    rightCardStatus = _SelectAnimationStatus.start;
    leftCardMatchanimationController.forward();
    rightCardMatchanimationController.forward();
  }
}