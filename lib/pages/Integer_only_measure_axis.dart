import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class IntegerOnlyMeasureAxis extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  IntegerOnlyMeasureAxis(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory IntegerOnlyMeasureAxis.withSampleData() {
    return new IntegerOnlyMeasureAxis(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory IntegerOnlyMeasureAxis.withRandomData() {
    return new IntegerOnlyMeasureAxis(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<MyRow, DateTime>> _createRandomData() {
    final random = new Random();

    final data = [
      new MyRow(new DateTime(2017, 9, 1), 4),
      new MyRow(new DateTime(2017, 9, 2), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 3), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 4), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 5), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 6), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 7), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 8), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 9), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 10), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9,11), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 12), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 13), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 14), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 15), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 16), random.nextDouble().round()*10),
      new MyRow(new DateTime(2017, 9, 17), random.nextDouble().round()*10),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Provides a custom axis ensuring that the ticks are in whole numbers.
      primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
            // Make sure we don't have values less than 1 as ticks
            // (ie: counts).
              dataIsInWholeNumbers: true,
              // Fixed tick count to highlight the integer only behavior
              // generating ticks [0, 1, 2, 3, 4].
              desiredTickCount: 8)),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final random = new Random();

    final data = [
//      new MyRow(new DateTime(2017, 9, 1), 4),
//      new MyRow(new DateTime(2017, 9, 2), 6),
//      new MyRow(new DateTime(2017, 9, 3), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 4), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 5), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 6), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 7), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 8), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 9), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 10), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 11), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 12), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 13), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 14), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 15), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 16), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 17), random.nextDouble().round()),
//      new MyRow(new DateTime(2017, 9, 18), random.nextDouble().round()),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class MyRow {
  final DateTime timeStamp;
  final int headcount;
  MyRow(this.timeStamp, this.headcount);
}