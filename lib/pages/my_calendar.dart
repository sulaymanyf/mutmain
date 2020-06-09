import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mutmain/model/namaz_db_util.dart';
import 'package:mutmain/model/namaz_time.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  DateTime(2020,3, 1): ['New Year\'s Day'],
  DateTime(2020, 3, 6): ['Epiphany'],
  DateTime(2020, 3, 14): ['Valentine\'s Day'],
  DateTime(2019, 4, 21): ['Easter Sunday'],
  DateTime(2019, 4, 22): ['Easter Monday'],
};

class MyCalendar extends StatefulWidget {
  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> with TickerProviderStateMixin {
  NamazBdUtil namazBdUtil = NamazBdUtil();
  Map<DateTime, List> _events = {};
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  NamazTime namaz;

  Future<NamazTime> getNameVo(DateTime dateTime) async {
    namaz = await namazBdUtil
        .getNamazTime(DateFormat('yyyy-MM-dd').format(dateTime));
    if (namaz == null) {
      await namazBdUtil.insert(new NamazTime(
          DateFormat('yyyy-MM-dd').format(dateTime), "user", 0, 0, 0, 0, 0,0,0));
      namaz = await namazBdUtil
          .getNamazTime(DateFormat('yyyy-MM-dd').format(dateTime));
      //切记用完就close
    }
    return namaz;
  }

  @override
  initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    getNameVo(_selectedDay);

    setData(_selectedDay);
    print(_events.toString());
    _selectedEvents = _events[_selectedDay] ?? [];
    print(_selectedEvents);
    print("_selectedEvents");
    print(_events[_selectedDay]);
    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
//    print(_events.toString());
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    print(_events.toString());
    print(day);
    print(_events[day]);
    setState(() {
      _selectedEvents = _events[day] ?? [];
//      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Color(0xFF7273f7),
                elevation: 0.0,
                iconTheme: new IconThemeData(color: Color(0XFFF1B069))),
            preferredSize: Size.fromHeight(60)),

//        backgroundColor: Colors.grey.shade300,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTableCalendar(),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 100, right: 0, top: 0, bottom: 10),
              child: _buildEventList(),
            )),
          ],
        )
//      Stack(
//        children: <Widget>[
////          SizedBox(
////            height: 250,
////            width: double.infinity,
////            child: ProfileImage(image, fit: BoxFit.cover,),
////          ),
//          Container(
//            margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
//            child: Column(
//              mainAxisSize: MainAxisSize.max,
//              children: <Widget>[
////                  Stack(
////                    children: <Widget>[
////                      Container(
////                        padding: EdgeInsets.all(16.0),
////                        margin: EdgeInsets.only(top: 16.0),
////                        decoration: BoxDecoration(
////                            color: Colors.white,
////                            borderRadius: BorderRadius.circular(5.0)
////                        ),
////                        child: Column(
////                          crossAxisAlignment: CrossAxisAlignment.start,
////                          children: <Widget>[
////                            Container(
////                              margin: EdgeInsets.only(left: 96.0),
////                              child: Column(
////                                crossAxisAlignment: CrossAxisAlignment.start,
////                                children: <Widget>[
////                                  Text("Little Butterfly", style: Theme.of(context).textTheme.title,),
////                                  ListTile(
////                                    contentPadding: EdgeInsets.all(0),
////                                    title: Text("Product Designer"),
////                                    subtitle: Text("Kathmandu"),
////                                  ),
////                                ],
////                              ),
////                            ),
////                            SizedBox(height: 10.0),
////                            Row(
////                              children: <Widget>[
////                                Expanded(child: Column(
////                                  children: <Widget>[
////                                    Text("285"),
////                                    Text("Likes")
////                                  ],
////                                ),),
////                                Expanded(child: Column(
////                                  children: <Widget>[
////                                    Text("3025"),
////                                    Text("Comments")
////                                  ],
////                                ),),
////                                Expanded(child: Column(
////                                  children: <Widget>[
////                                    Text("650"),
////                                    Text("Favourites")
////                                  ],
////                                ),),
////                              ],
////                            ),
////                          ],
////                        ),
////                      ),
////                      Container(
////                        height: 80,
////                        width: 80,
////                        decoration: BoxDecoration(
////                            borderRadius: BorderRadius.circular(10.0),
////                            image: DecorationImage(
////                                image: CachedNetworkImageProvider(image),
////                                fit: BoxFit.cover
////                            )
////                        ),
////                        margin: EdgeInsets.only(left: 16.0),
////                      ),
////
////                    ],
////                  ),
//
//
//              ],
//            ),
//          ),
//        ],
//      ),
        );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
//      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
                ? Colors.brown[300]
                : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  getColor(num) {
    print("getColor");
    print(num);
    if (num == 1) {
      return Colors.red;
    } else if (num == 2) {
      return Colors.amber;
    } else {
      return null;
    }
  }

  Widget _buildEventList() {
    return Row(
      children: _selectedEvents
          .map(
            (event) => Icon(
              // 新增代码开始 ...
              event == 0 ? Icons.favorite_border : Icons.favorite,
              color: getColor(event),
              size: 40,
            ),
          )
          .toList(),
    );
  }

  Future<List> getNameVoData(DateTime subtract) async {
    var namazTime = await getNameVo(subtract);
    print(namazTime.fajr);
    var list = List();
    list.add(namazTime?.fajr);
    list.add(namazTime?.dhur);
    list.add(namazTime?.asr);
    list.add(namazTime?.maghrib);
    list.add(namazTime?.isha);
    print("-------------");
    print(list.toString());
    return list;
//    });
  }
  Future<void> setData(DateTime _selectedDay) async {
    Map<DateTime, List> events = {};
    for (int i = 0; i < 31; i++) {
      print(getNameVoData(_selectedDay.subtract(Duration(days: i))).toString());
//      _events[_selectedDay.subtract(Duration(days: i))]=getNameVoData(_selectedDay.subtract(Duration(days: i)));  [namaz?.fajr,namaz?.dhur,namaz?.asr,namaz?.maghrib,namaz?.isha];
      events[_selectedDay.subtract(Duration(days: i))] =
          await getNameVoData(_selectedDay.subtract(Duration(days: i)));
    }
    for (int i = 0; i < 31; i++) {
      print(getNameVoData(_selectedDay.subtract(Duration(days: i))).toString());
//      _events[_selectedDay.subtract(Duration(days: i))]=getNameVoData(_selectedDay.subtract(Duration(days: i)));  [namaz?.fajr,namaz?.dhur,namaz?.asr,namaz?.maghrib,namaz?.isha];
      events[_selectedDay.add(Duration(days: i))] =
//      events[_selectedDay.add(Duration(days: i))] =
          await getNameVoData(_selectedDay.add(Duration(days: i)));
    }
    print(_selectedDay.subtract(Duration(days: 0)));
    print(_selectedDay);

    DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      _events = events;
    });
    print("setData");
    print(_events.toString());
  }
}
