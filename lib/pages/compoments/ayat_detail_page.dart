import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutmain/model/verses.dart';
import 'package:mutmain/request/prayer_time_api.dart';

class AyatDetailPage extends StatefulWidget {
  final int id;

  const AyatDetailPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _AyatDetailPage createState() => _AyatDetailPage();
}

class _AyatDetailPage extends State<AyatDetailPage> {
  List quanlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PrayerTimeApi.getQuran(widget.id).then((r) {
      setState(() {
        print(r);
        print(quanlist);
        print("-------------------");
        quanlist = r;
        print(quanlist);
        print(Verses.fromJson(quanlist[0]).textMadani);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF7273f7),
          ),
          body: ListView.builder(
              shrinkWrap: true,
              itemCount: (quanlist == null) ? 0 : quanlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                      Verses.fromJson(quanlist[index]).textIndopak,
                      style: TextStyle(fontFamily: "Quran", fontSize: 20),
                    ),
                    subtitle: Text(
                        Verses.fromJson(quanlist[index]).translations[0].text));
              }),
        ));
  }
}
