import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ideal_type/data/content.dart';

import 'package:ideal_type/Components/VersusIcon.dart';

class SelectPage extends StatefulWidget{
  SelectPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectPageState();
}

enum _SelectAnimationStatus { stay, start, select, discard, animating }

class _SelectPageState extends State<SelectPage>
  with TickerProviderStateMixin {

  AnimationController leftCardSelectanimationController;
  AnimationController leftCardDiscardanimationController;
  AnimationController leftCardMatchanimationController;

  AnimationController rightCardSelectanimationController;
  AnimationController rightCardDiscardanimationController;
  AnimationController rightCardMatchanimationController;

  AnimationController textShowAnimationController;

  Animation<double> selectedLeftCardAnimation;
  Animation<double> selectedRightCardAnimation;

  Animation<double> discardedLeftCardAnimation;
  Animation<double> discardedRightCardAnimation;

  Animation<double> discardedLeftCardColorChangeAnimation;
  Animation<double> discardedRightCardColorChangeAnimation;

  Animation<double> matchLeftCardAnimation;
  Animation<double> matchRightCardAnimation;

  Animation<Color> textFadeInAnimation;
  Animation<double> textScaleUpAnimation;
  Animation<Color> textFadeOutAnimation;

  Tween<double> leftCardCenterToLeft;
  Tween<double> leftCardToLeft;

  Tween<double> rightCardCenterToRight;
  Tween<double> rightCardToRight;

  Function listener;

  _SelectAnimationStatus leftCardStatus;
  _SelectAnimationStatus rightCardStatus;

  List<Content> temp = [];
  String message = '';
  
  bool end = false;
  bool select = false;

  @override
  void initState() {
    super.initState();

    leftCardSelectanimationController = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..addListener(
      (){}
    );

    leftCardDiscardanimationController = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardSelectanimationController = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..addListener(
      (){}
    );

    rightCardDiscardanimationController = new AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    )..addListener(
      (){}
    );

    textShowAnimationController = new AnimationController(
      duration: const Duration(milliseconds: 5000),
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

    leftCardToLeft = new Tween(begin: 0.0, end: -500.0);
    leftCardCenterToLeft = new Tween(begin: 150.0, end: -500.0);

    rightCardToRight = new Tween(begin: 0.0, end: 500.0);
    rightCardCenterToRight = new Tween(begin: -150.0, end:500.0);

    selectedLeftCardAnimation = new Tween(
      begin: 0.0, 
      end: 150.0
    ).animate(
      new CurvedAnimation(
        parent: leftCardSelectanimationController,
        curve: Curves.easeOut,
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
        curve: Curves.easeOut,
      ),
    )..addListener(() {
      setState((){
      });  
    });    
   
    discardedLeftCardAnimation = leftCardToLeft.animate(
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

    discardedRightCardAnimation = rightCardToRight.animate(
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

    textScaleUpAnimation = new Tween(
      begin: 1.0,
      end: 1.5
    ).animate(
      new CurvedAnimation(
        parent: textShowAnimationController,
        curve:  new Interval(
          0.0,
          0.70,
          curve: Curves.bounceInOut,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    });

    textFadeOutAnimation = new Tween(
      begin: Color.fromARGB(255, 0, 0, 0),
      end: Color.fromARGB(0, 0, 0, 0),
    ).animate(
      new CurvedAnimation(
        parent: textShowAnimationController,
        curve:  new Interval(
          0.70,
          1.00,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState((){
      });  
    })..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.completed)
      {
        setState((){
          message = '';
        });
        
        _startMatch();
      }
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

  void _startMatch() {
    _reset();

    if(img.length <= 0)
      _next();
    else
    {
      leftCardStatus = _SelectAnimationStatus.start;
      rightCardStatus = _SelectAnimationStatus.start;

      leftCardMatchanimationController.forward();
      rightCardMatchanimationController.forward();
    }
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
    {
      img = temp.map((element)=>element).toList(); // Copy
      temp.clear();
    }
          
    img.shuffle();

    setState((){
      message = img.length.toString() + ' 강';  
    });

    textShowAnimationController.forward();
  }

  void _prepareNext(Content selectContent){
    select = false;
    img.removeAt(0);
    img.removeAt(0);

    temp.add(selectContent);
    _startMatch();
  }

  void _onTapLeftCard(Content selectContent){
    if(leftCardDiscardanimationController.isAnimating)
      return;
    
    if(leftCardMatchanimationController.isAnimating)
      return;
    
    if(leftCardSelectanimationController.isAnimating)
      return;

    if(select)
      _discardLeftAfterSelectAnimation(selectContent);  
    else
      _selectLeftAnimation();
  }

  void _onDiscardLeftComplete(Content selectContent){
    _prepareNext(selectContent);

    discardedLeftCardAnimation = leftCardToLeft
    .animate(leftCardDiscardanimationController);
    //..addListener(() => setState((){}));
  }

  void _selectLeftAnimation(){
    select = true;

    leftCardStatus = _SelectAnimationStatus.select;
    rightCardStatus = _SelectAnimationStatus.discard;
        
    leftCardSelectanimationController.forward();
    rightCardDiscardanimationController.forward();
  }

  void _discardLeftAfterSelectAnimation(Content selectContent){
    leftCardStatus = _SelectAnimationStatus.discard;
    
    void _onStatusChange(AnimationStatus status){
      if(status == AnimationStatus.completed)
      {
        _onDiscardLeftComplete(selectContent);
        discardedLeftCardAnimation.removeStatusListener(_onStatusChange);
      }
    }

    discardedLeftCardAnimation = leftCardCenterToLeft
    .animate(leftCardDiscardanimationController)
    ..removeStatusListener(listener)
    ..addStatusListener(_onStatusChange);
    leftCardDiscardanimationController.forward();
  }

  void _onTapRightCard(Content selectContent){
    if(rightCardDiscardanimationController.isAnimating)
      return;
    
    if(rightCardMatchanimationController.isAnimating)
      return;
    
    if(rightCardSelectanimationController.isAnimating)
      return;

    if(select)
      _discardRightAfterSelectAnimation(selectContent);  
    else
      _selectRightAnimation();
  }

  void _onDiscardRightComplete(Content selectContent){
    _prepareNext(selectContent);

    discardedRightCardAnimation = rightCardToRight
    .animate(rightCardDiscardanimationController);
  }

  void _selectRightAnimation(){
    select = true;

    leftCardStatus = _SelectAnimationStatus.discard;
    rightCardStatus = _SelectAnimationStatus.select;
        
    rightCardSelectanimationController.forward();
    leftCardDiscardanimationController.forward();
  }

  void _discardRightAfterSelectAnimation(Content selectContent){
    rightCardStatus = _SelectAnimationStatus.discard;
    
    void _onStatusChange(AnimationStatus status){
      if(status == AnimationStatus.completed)
      {
        _onDiscardRightComplete(selectContent);
        discardedRightCardAnimation.removeStatusListener(_onStatusChange);
      }
    }

    discardedRightCardAnimation = rightCardCenterToRight
    .animate(rightCardDiscardanimationController)
    ..addStatusListener(_onStatusChange);
    rightCardDiscardanimationController.forward();
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

  Widget _buildMessageBoard(){
    if(message == '')
      return new Container();

    var scale = textScaleUpAnimation.value;
    var color = textFadeOutAnimation.value;

    return new Center(
      child: new Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width/2,
        height: MediaQuery.of(context).size.height/2.5,
        child: new Transform.scale(
          scale : scale,
          child: new Text(
            message,
            textAlign: TextAlign.center,
              style: new TextStyle(
              color: color,
              fontSize: 18,
            )
          )
        )   
      )
    );
  }

  Widget _buildCardView(bool isLeft, Size screenSize){
    Offset offset = Offset(_getOffsetValue(isLeft), 0.0);
    var index = isLeft ? 0 : 1;

    return GestureDetector(
      onTap: () => isLeft ? _onTapLeftCard(img[index]) : _onTapRightCard(img[index]),
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
                        image: img[index].image,//new ExactAssetImage('assets/left.png'),
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
                          img[index].name,
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
  void dispose() {
    leftCardDiscardanimationController.dispose();
    rightCardDiscardanimationController.dispose();
    leftCardSelectanimationController.dispose();
    rightCardSelectanimationController.dispose();
    leftCardMatchanimationController.dispose();
    rightCardMatchanimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    //final double percent = (_animationController.value * 100.0);
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Expanded(
                flex:1,
                child: _buildCardView(true, screenSize)
              ),
              new Container(
                width: 5,
              ),
              new Expanded(
                flex:1,
                child: _buildCardView(false, screenSize)
              ),
            ],
          ),
          new Container(
            alignment: Alignment.center,
            child: new VersusIcon()
          )
        ]
      )
    );
  }  
}