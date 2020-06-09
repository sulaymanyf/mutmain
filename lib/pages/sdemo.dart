// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:developer';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'Integer_only_measure_axis.dart';
import 'app_config.dart';
import 'gallery_drawer.dart';
import 'gallery_scaffold.dart';

/// Main entry point of the gallery app.
///
/// This renders a list of all available demos.
class Home extends StatelessWidget {
  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;

  Home(
      {Key key,
        this.showPerformanceOverlay,
        this.onShowPerformanceOverlayChanged})
      : super(key: key) {
    assert(onShowPerformanceOverlayChanged != null);
  }

  @override
  Widget build(BuildContext context) {


    _setupPerformance();

    return new Scaffold(
      drawer: new GalleryDrawer(
          showPerformanceOverlay: showPerformanceOverlay,
          onShowPerformanceOverlayChanged: onShowPerformanceOverlayChanged),
      appBar: new AppBar(title: new Text(defaultConfig.appName)),
      body: GalleryScaffold(
        listTileIcon: new Icon(Icons.show_chart),
        title: 'Integer Measure Ticks',
        subtitle: 'Timeseries with only whole number measure axis ticks',
        childBuilder: () => new IntegerOnlyMeasureAxis.withRandomData(),
      ),
    );
  }

  void _setupPerformance() {
    // Change [printPerformance] to true and set the app to release mode to
    // print performance numbers to console. By default, Flutter builds in debug
    // mode and this mode is slow. To build in release mode, specify the flag
    // blaze-run flag "--define flutter_build_mode=release".
    // The build target must also be an actual device and not the emulator.
    charts.Performance.time = (String tag) => Timeline.startSync(tag);
    charts.Performance.timeEnd = (_) => Timeline.finishSync();
  }
}

