import 'package:flutter/material.dart';
import 'package:mutmain/navigator/tab_navigator.dart';


final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class SplashPage extends StatefulWidget{

  SplashPage({Key key}):super(key:key);
  @override
  _SplashPage createState()=> new _SplashPage();

}

class _SplashPage extends State<SplashPage>{

  bool isStartHomePage = false;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body:  Container(
        height: _screenSize.height,
        child: GestureDetector(
          onTap:() => goToHomePage(context),//设置页面点击事件
          child:  Image.asset("images/splash_img.jpg",fit: BoxFit.cover,width: _screenSize.width,height: _screenSize.height,),//此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
        ),
      )
    );
  }

  //页面初始化状态的方法
  @override
  void initState() {
    super.initState();
    //开启倒计时
    countDown();
  }

  void countDown() {
    print("countDowncountDowncountDown");
    print(context);
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 2);
    new Future.delayed(duration, ()=>goToHomePage(_scaffoldKey.currentContext));
  }

  void goToHomePage(context){
    print("goToHomePage");
    //如果页面还未跳转过则跳转页面
    if(!isStartHomePage){
      print("isStartHomePage");
      print(isStartHomePage);
      isStartHomePage=true;
      //跳转主页 且销毁当前页面
      print(context);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => TabNavigator()))
      Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>TabNavigator()), (Route<dynamic> rout)=>false);

    }
  }
}