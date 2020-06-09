import 'package:intl/intl.dart';

class PrayerTime {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  PrayerTime(
      {this.fajr, this.sunrise, this.dhuhr, this.asr, this.maghrib, this.isha});

  PrayerTime.fromJson(Map<String, dynamic> json) {
    fajr = current_time(json['fajr']);
    sunrise = current_time(json['sunrise']);
    dhuhr = current_time(json['dhuhr']);
    asr = current_time(json['asr']);
    maghrib = current_time(json['maghrib']);
    isha = current_time(json['isha']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fajr'] = this.fajr;
    data['sunrise'] = this.sunrise;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['isha'] = this.isha;
    return data;
  }

  String current_time(now) {
    var format = new DateFormat('HH:mm a');
    return format.format(now);
    return null;
  }
}