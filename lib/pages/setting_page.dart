import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mutmain/generated/i18n.dart';
import 'package:mutmain/navigator/tab_navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../change_local_izations.dart';
import '../tools.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeLocalizationsStatus(
      child: SettingPageDetil(),
    );
  }
}

class SettingPageDetil extends StatefulWidget {
  @override
  _SettingPage createState() => _SettingPage();

}






class _SettingPage extends State<SettingPageDetil> {

  _setCurrentDeviceLocale(Locale deviceLocale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', deviceLocale.languageCode);
    prefs.setString('countryCode', deviceLocale.countryCode);

    eventBus.fire(deviceLocale);
    Navigator.of(context).pop();
//    Navigator.of(context).pop();
//    Navigator.of(context).pop();
  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));

  }
  changLang(context, num) {
    if (num == 1) {
      return _setCurrentDeviceLocale(Locale("zh", "CN"));
    } else if (num == 2) {
      return _setCurrentDeviceLocale(Locale("en", ""));
    } else if (num == 3) {
      return _setCurrentDeviceLocale(Locale("tr", "TR"));
    } else if (num == 4) {
      return _setCurrentDeviceLocale(Locale("en", "US"));
    }
  }

  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: ListView(
            children: List.generate(
              4,
                  (index) => InkWell(
                    hoverColor:  Color(0xFF4a5266),
                  child: Container(
                      color:  Color(0xFF4a5266),
                      alignment: Alignment.center,
                      height: 60.0,
                      child: Text(getlang(index + 1, context))),
                  onTap: () {
                    changLang(context, index + 1);
                  }),
            )),
        height: 240,
      ),
    );
  }

  getlang(num, context) {
    print("getlang");
    print(num);
    if (num == 1) {
      return S.of(context).app_cn;
    } else if (num == 2) {
      return S.of(context).app_en;
    } else if (num == 3) {
      return S.of(context).app_tr;
    } else if (num == 4) {
      return S.of(context).app_auto;
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:  Color(0xFF343a49),
      appBar: AppBar(
        backgroundColor: Color(0xFF8078f7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: ()=> {Navigator.push(context, MaterialPageRoute(builder: (context) => TabNavigator()))},
        ),
        title: Text(S.of(context).universal),

      ),
      body: ListView(
        padding: EdgeInsets.all(2.5),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => {
              _showModalBottomSheet(context)
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>SettingPage()))
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF4a5266),
                    borderRadius: BorderRadius.circular(5.0)),
                height: 56,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 6),
                  child: Text(
                    S.of(context).language,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                )),
          ),
          Divider(height: 1.0, indent: 0.0, color: Colors.white),
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF4a5266),
                    borderRadius: BorderRadius.circular(5.0)),
                height: 56,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 6),
                  child: Text(
                    S.of(context).sect,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                )),
          ),
          Divider(height: 1.0, indent: 0.0, color: Colors.white),
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    color:Color(0xFF4a5266),
                    borderRadius: BorderRadius.circular(5.0)),
                height: 56,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 6),
                  child: Text(
                    S.of(context).method,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24,color: Colors.white),
                  ),
                )),
          ),
          Divider(height: 1.0, indent: 0.0, color: Colors.white),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(top: 2),
              child: Container(
                  decoration: BoxDecoration(
                      color:Color(0xFF4a5266),
                      borderRadius: BorderRadius.circular(5.0)),
                  height: 56,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 6),
                    child: Text(
                      S.of(context).latlan,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 24,color: Colors.white),
                    ),
                  )),
            )
          ),
          Divider(height: 1.0, indent: 0.0, color: Colors.white),
        ],
      ),
    );
  }
}

//  Container(
//                          margin: EdgeInsets.only(top: 16.0),
//                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.circular(5.0)),
//                          child: Column(
//                            children: <Widget>[
//                              FlatButton(
//                                  onPressed: () {
//                                    _setCurrentDeviceLocale(Locale("en", ""));
//                                  },
//                                  child: Text(S.of(context).app_en)),
//                              FlatButton(
//                                  onPressed: () {
//                                    _setCurrentDeviceLocale(Locale("zh", "CN"));
//                                  },
//                                  child: Text(S.of(context).app_cn)),
//                              FlatButton(
//                                  onPressed: () {
//                                    Navigator.of(context).pop(); //  跟随系统
//                                  },
//                                  child: Text(S.of(context).app_auto))
//                            ],
//                          )),
