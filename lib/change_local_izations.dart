import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tools.dart';

class ChangeLocalizationsStatus extends StatefulWidget {
  final Widget child;
  ChangeLocalizationsStatus({Key key,this.child}):super(key : key);

  @override
  _ChangeLocalizationsStatusState createState() => _ChangeLocalizationsStatusState();
}

class _ChangeLocalizationsStatusState extends State<ChangeLocalizationsStatus> {
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
    print("----------------------"+_locale.toString());
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
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}