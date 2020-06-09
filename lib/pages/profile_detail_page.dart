import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutmain/boot/on_boarding_screen.dart';
import 'package:mutmain/generated/i18n.dart';
import 'package:mutmain/pages/compass.dart';
import 'package:mutmain/pages/sdemo.dart';
import 'package:mutmain/pages/setting_page.dart';

import '../main.dart';
import 'app_config.dart';
import 'compoments/toast.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FreeLocalizations(
      child: ProfileDetailpage(),
    );
  }
}

class ProfileDetailpage extends StatefulWidget {
  @override
  _ProfileDetailpageState createState() => _ProfileDetailpageState();
}

class _ProfileDetailpageState extends State<ProfileDetailpage> {
  bool _showPerformanceOverlay = defaultConfig.showPerformanceOverlay;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc343a49),
      body: Stack(
        children: <Widget>[
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Container(
                color: Color(0xFF7273f7),
//                decoration: BoxDecoration(
//                    image: DecorationImage(
//                        image: AssetImage('assets/image/user/man.png'),
//                        fit: BoxFit.cover)),
              )),
//        new Positioned(
//          top: 180.0,
//          left: 0.0,
//          bottom: 0.0,
//          right: 0.0,
//          //here the body
//          child:,
//        ),

          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: new Container(
                    child: new Column(
                  children: <Widget>[
                    new SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        new Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
//                                  child: new Container(
//                                    width: 150.0,
//                                    height: 150.0,
//                                    decoration: BoxDecoration(
//                                      shape: BoxShape.rectangle,
//                                      borderRadius: new BorderRadius.circular(5.0),
//                                      image: DecorationImage(
//                                        image: AssetImage('assets/image/user/man.png'),
//                                      ),
//                                    ),
//                                  ),
                        )),
//                          new Expanded(
//                              child: new Container(
//                                height: 100.0,
//                                child: Column(
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Padding(
//                                          padding: const EdgeInsets.only(
//                                              bottom: 2.5, right: 2.5),
//                                          child: GestureDetector(
//                                            behavior: HitTestBehavior.opaque,
//                                            onTap: () => {
//                                              Navigator.pushNamed(
//                                                  context, "quanPageRoute")
//                                            },
//                                            child:  new Container(
//                                              decoration: new BoxDecoration(
//                                                  color: Color(0XFF2BD093),
//                                                  borderRadius: new BorderRadius.circular(5.0)),
//                                              child: new Row(
//                                                mainAxisAlignment: MainAxisAlignment.center,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(right: 8.0),
//                                                    child: new Icon(
//                                                        IconData(0xe604, fontFamily: 'MyIcons'),
//                                                        color: Colors.blueGrey),
//                                                  ),
//                                                  new Text('Quran',
//                                                      style: new TextStyle(color: Colors.white))
//                                                ],
//                                              ),
//                                            ),
//                                          )),
//                                    ),
//                                    Expanded(
//                                        child: Padding(
//                                          padding:
//                                          const EdgeInsets.only(top: 2.5, right: 2.5),
//                                          child: GestureDetector(
//                                            onTap: () => {
//                                              Toast.toast(context,msg: S.of(context).stay_tuned)
//                                            },
//                                            child: new Container(
//                                              decoration: new BoxDecoration(
//                                                  color: Color(0XFFFC7B4D),
//                                                  borderRadius:
//                                                  new BorderRadius.circular(5.0)),
//                                              child: new Row(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.center,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding:
//                                                    const EdgeInsets.only(right: 8.0),
//                                                    child: new Icon(
//                                                      IconData(0xe605,
//                                                          fontFamily: 'MyIcons'),
//                                                      color: Colors.white,
//                                                    ),
//                                                  ),
//                                                  new Text('Hadis',
//                                                      style: new TextStyle(
//                                                          color: Colors.white))
//                                                ],
//                                              ),
//                                            ),
//                                          ),
//                                        )),
//                                  ],
//                                ),
//                              )),
//                          new Expanded(
//                              child: new Container(
//                                height: 100.0,
//                                child: Column(
//                                  children: <Widget>[
//                                    Expanded(
//                                      child: Padding(
//                                          padding: const EdgeInsets.only(
//                                              left: 2.5, bottom: 2.5),
//                                          child: GestureDetector(
//                                            onTap: () => {
//                                              Navigator.push(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          Compass()))
//                                            },
//                                            child: new Container(
//                                              decoration: new BoxDecoration(
//                                                  color: Color(0XFF53CEDB),
//                                                  borderRadius:
//                                                  new BorderRadius.circular(5.0)),
//                                              child: new Row(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.center,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(
//                                                        right: 8.0),
//                                                    child: new Icon(IconData(0xe603,
//                                                        fontFamily: 'MyIcons')),
//                                                  ),
//                                                  new Text('Mecca',
//                                                      style: new TextStyle(
//                                                          color: Colors.white))
//                                                ],
//                                              ),
//                                            ),
//                                          )),
//                                    ),
//                                    // Compass
//                                    Expanded(
//                                      child: Padding(
//                                          padding: const EdgeInsets.only(
//                                              left: 2.5, top: 2.5),
//                                          child: GestureDetector(
//                                            onTap: () => {
//                                              Navigator.push(
//                                                  context,
//                                                  MaterialPageRoute(
//                                                      builder: (context) =>
//                                                          MyCalendar()))
//                                            },
//                                            child: Container(
//                                              decoration: new BoxDecoration(
//                                                  color: Color(0XFFF1B069),
//                                                  borderRadius:
//                                                  new BorderRadius.circular(5.0)),
//                                              child: new Row(
//                                                mainAxisAlignment:
//                                                MainAxisAlignment.center,
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(
//                                                        right: 8.0),
//                                                    child: new Icon(
//                                                      Icons.art_track,
//                                                      color: Colors.white,
//                                                    ),
//                                                  ),
//                                                  new Text(
//                                                    'Jobs',
//                                                    style: new TextStyle(
//                                                        color: Colors.white),
//                                                  )
//                                                ],
//                                              ),
//                                            ),
//                                          )),
//                                    ),
//                                  ],
//                                ),
//                              )),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(S.of(context).prifile_name,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                  fontWeight: FontWeight.w600

                                ))
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF4a5266),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Row(
                        children: <Widget>[
                          new Expanded(
                              child: new Container(
                            height: 100.0,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 2.5, right: 2.5),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => {
                                          Navigator.pushNamed(
                                              context, "quanPageRoute")
                                        },
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0XFF2BD093),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0)),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: new Icon(
                                                    IconData(0xe604,
                                                        fontFamily: 'MyIcons'),
                                                    color: Colors.blueGrey),
                                              ),
                                              new Text(S.of(context).quran,
                                                  style: new TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 2.5, right: 2.5),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () => {
                                      Toast.toast(context,
                                          msg: S.of(context).stay_tuned)
                                    },
                                    child: new Container(
                                      decoration: new BoxDecoration(
                                          color: Color(0XFFFC7B4D),
                                          borderRadius:
                                              new BorderRadius.circular(5.0)),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: new Icon(
                                              IconData(0xe605,
                                                  fontFamily: 'MyIcons'),
                                              color: Colors.white,
                                            ),
                                          ),
                                          new Text(S.of(context).hadis,
                                              style: new TextStyle(
                                                  color: Colors.white))
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          )),
                          new Expanded(
                              child: new Container(
                            height: 100.0,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.5, bottom: 2.5),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Compass()))
                                        },
                                        child: new Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0XFF53CEDB),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0)),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: new Icon(IconData(0xe603,
                                                    fontFamily: 'MyIcons')),
                                              ),
                                              new Text(S.of(context).mecca,
                                                  style: new TextStyle(
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                                // Compass
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.5, top: 2.5),
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Home(
                                                    showPerformanceOverlay: _showPerformanceOverlay,
                                                    onShowPerformanceOverlayChanged: (bool value) {
                                                      setState(() {
                                                        _showPerformanceOverlay = value;
                                                      });
                                                    },
                                                  )
                                              ))
                                        },
                                        child: Container(
                                          decoration: new BoxDecoration(
                                              color: Color(0XFFF1B069),
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      5.0)),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: new Icon(
                                                  Icons.art_track,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              new Text(
                                                'Jobs',
                                                style: new TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF4a5266),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                        title: Text(S.of(context).setting,style: TextStyle(color: Colors.white),),
                        leading: new Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPage()))
                        },
                      ),
                    ),
                    new SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF4a5266),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ListTile(
                        title: Text(S.of(context).startup_page,style: TextStyle(color: Colors.white),),
                        leading: new Icon(
                          Icons.settings_backup_restore,
                          color: Colors.white,
                        ),
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnboardingScreen()))
                        },
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
