import 'package:flutter/material.dart';
import 'package:mutmain/generated/i18n.dart';
import 'package:mutmain/request/prayer_time_api.dart';

import '../change_local_izations.dart';
import 'compoments/ayat_detail_page.dart';

class QuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeLocalizationsStatus(
      child: QuranPageDetil(),
    );
  }
}

class QuranPageDetil extends StatefulWidget {
  @override
  _QuranPageState createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPageDetil> {
  List quanlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PrayerTimeApi.getQuranTitle().then((r) {
      setState(() {
        print(r);
        print(quanlist);
        print("-------------------");
        quanlist = r;
        print(quanlist);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7273f7),
        title: Text(S.of(context).quran),
        centerTitle: true,
      ),
      body: ListView.separated(
        //cacheExtent  设置预加载的区域
        cacheExtent: 30.0,
        //确定每一个item的高度 会让item加载更加高效
        //AlwaysScrollableScrollPhysics() 总是可以滑动
        //NeverScrollableScrollPhysics禁止滚动
        //BouncingScrollPhysics 内容超过一屏 上拉有回弹效果
        //ClampingScrollPhysics 包裹内容 不会有回弹
        // 滑动类型
        physics: new ClampingScrollPhysics(),
        itemCount: (quanlist == null) ? 0 : quanlist.length,
        itemBuilder: (context, index) {
          return QuranTitle(
            data: QuranTitleViewModel.fromJson(quanlist[index]),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 0.2,
            indent: 45,
            color: Color(0xFFDDDDDD),
          );
        },
      ),
    );
  }
}

class QuranTitle extends StatelessWidget {
  final QuranTitleViewModel data;

  const QuranTitle({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AyatDetailPage(id: this.data.chapterNumber)))
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 15)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        this.data.nameArabic,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        this.data.nameComplex,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF999999),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(
                    this.data.chapterNumber.toString() + " "+ S.of(context).chapter,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuranTitleViewModel {
  int id;
  int chapterNumber;
  bool bismillahPre;
  int revelationOrder;
  String revelationPlace;
  String nameComplex;
  String nameArabic;
  String nameSimple;
  int versesCount;
  List<int> pages;
  TranslatedName translatedName;

  QuranTitleViewModel(
      {this.id,
        this.chapterNumber,
        this.bismillahPre,
        this.revelationOrder,
        this.revelationPlace,
        this.nameComplex,
        this.nameArabic,
        this.nameSimple,
        this.versesCount,
        this.pages,
        this.translatedName});

  QuranTitleViewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterNumber = json['chapter_number'];
    bismillahPre = json['bismillah_pre'];
    revelationOrder = json['revelation_order'];
    revelationPlace = json['revelation_place'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    nameSimple = json['name_simple'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
    translatedName = json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_number'] = this.chapterNumber;
    data['bismillah_pre'] = this.bismillahPre;
    data['revelation_order'] = this.revelationOrder;
    data['revelation_place'] = this.revelationPlace;
    data['name_complex'] = this.nameComplex;
    data['name_arabic'] = this.nameArabic;
    data['name_simple'] = this.nameSimple;
    data['verses_count'] = this.versesCount;
    data['pages'] = this.pages;
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName.toJson();
    }
    return data;
  }
}

class TranslatedName {
  String languageName;
  String name;

  TranslatedName({this.languageName, this.name});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_name'] = this.languageName;
    data['name'] = this.name;
    return data;
  }
}
