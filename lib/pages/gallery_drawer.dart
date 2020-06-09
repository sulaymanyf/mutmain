import 'package:flutter/material.dart';

/// A menu drawer supporting toggling theme and performance overlay.
class GalleryDrawer extends StatelessWidget {
  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;

  GalleryDrawer(
      {Key key,
        this.showPerformanceOverlay,
        this.onShowPerformanceOverlayChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(children: <Widget>[
        // Performance overlay toggle.
        new ListTile(
          leading: new Icon(Icons.assessment),
          title: new Text('Performance Overlay'),
          onTap: () {
            onShowPerformanceOverlayChanged(!showPerformanceOverlay);
          },
          selected: showPerformanceOverlay,
          trailing: new Checkbox(
            value: showPerformanceOverlay,
            onChanged: (bool value) {
              onShowPerformanceOverlayChanged(!showPerformanceOverlay);
            },
          ),
        ),
      ]),
    );
  }
}