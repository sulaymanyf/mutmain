



class NamazTime {
  int id;
  String name;
  String time;
  int fajr;
  int dhur;
  int asr;
  int maghrib;
  int isha;
  int duha;
  int tahajjud;


  NamazTime(this.time,
      this.name,
      this.fajr,
      this.dhur,
      this.asr,
      this.maghrib,
      this.duha,
      this.tahajjud,
      this.isha);

  NamazTime.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    fajr = json['fajr'];
    dhur = json['dhur'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    id = json['id'];
    duha = json['duha'];
    tahajjud = json['tahajjud'];
    name = json['name'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['fajr'] = this.fajr;
    data['dhur'] = this.dhur;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['id'] = this.id;
    data['name'] = this.name;
    data['isha'] = this.isha;
    data['tahajjud'] = this.tahajjud;
    data['duha'] = this.duha;
    return data;
  }
}


