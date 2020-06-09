import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import 'compoments/loading_indicator.dart';
import 'compoments/qiblah_compass.dart';

class Compass extends StatefulWidget {
  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              iconTheme: new IconThemeData(color: Color(0XFFF1B069))),
          preferredSize: Size.fromHeight(30)),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.hasError)
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );

          if (snapshot.data) return QiblahCompass();
//            else
//              return QiblahMaps();
        },
      ),
    );
  }
}
