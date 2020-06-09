import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mutmain/pages/profile_detail_page.dart';
import 'package:mutmain/pages/quran_page.dart';
import 'package:mutmain/tools.dart';
import 'package:mutmain/utils/sp_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'boot/on_boarding_screen.dart';
import 'generated/i18n.dart';
import 'navigator/tab_navigator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  realRunApp();
}

void realRunApp() async {
  bool success = await SpUtil.getInstance();
  print("init-" + success.toString());
  runApp(MyApp());
  if (Platform.isAndroid) {
    print("android");
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final Color primaryColor = Color(0xffFD6592);
  final Color bgColor = Color(0xffF9E0E3);
  final Color secondaryColor = Color(0xff324558);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget rootPage;
    bool started = SpUtil.preferences.getBool('Started') == null ? false : true;
    if (started) {
      // 非首次启动
      rootPage = TabNavigator();
    } else {
      // 首次启动
      rootPage = OnboardingScreen();
    }
    return MaterialApp(
        routes: {
          "quanPageRoute": (BuildContext context) => new QuranPage(),
          "ProfilePageRoute": (BuildContext context) => new ProfilePage(),
        },
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme(
              title: TextStyle(
                color: secondaryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            iconTheme: IconThemeData(color: secondaryColor),
            actionsIconTheme: IconThemeData(
              color: secondaryColor,
            ),
          ),
        ),
        home: FreeLocalizations(
            key: new GlobalKey<_FreeLocalizations>(),
            child: rootPage// QuranPage() //
            ),
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          setDefaultLan(locale, supportedLocales);
        });
  }

  Future<void> setDefaultLan(
      Locale locale, Iterable<Locale> supportedLocales) async {
    if (locale?.countryCode == "CN") {
      SpUtil.preferences.setString("languageCode", "zh");
      SpUtil.preferences.setString("countryCode", locale?.countryCode);
    } else if(locale?.countryCode == "TR") {
      SpUtil.preferences.setString("languageCode", "tr");
      SpUtil.preferences.setString("countryCode", locale?.countryCode);
    } else {
      SpUtil.preferences.setString("languageCode", locale?.languageCode);
      SpUtil.preferences.setString("countryCode", locale?.countryCode);
    }
  }
}

class FreeLocalizations extends StatefulWidget {
  final Widget child;

  FreeLocalizations({Key key, this.child}) : super(key: key);

  @override
  State<FreeLocalizations> createState() {
    return new _FreeLocalizations();
  }
}

class _FreeLocalizations extends State<FreeLocalizations> {
  Locale _locale = Locale("en", "");

  Future<Locale> getDeviceLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageStr = prefs.getString('languageCode');
    String country = prefs.getString('countryCode');
    return Locale(languageStr, country);
  }

  //监听bus
  void listen() {
    eventBus.on<Locale>().listen((locale) {
      changeLocale(locale);
    });
  }

  changeLocale(Locale locale) {
    if (!mounted) {
      return;
    }

    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<Locale> locale = getDeviceLocale();
    locale.then((locales) {
      changeLocale(locales);
    });
  }

  @override
  Widget build(BuildContext context) {
//    listen(); 是否需要全部更新
    return new Localizations.override(
      context: context,
      locale: _locale, // widget.locale,
      child: widget.child,
    );
  }
}
