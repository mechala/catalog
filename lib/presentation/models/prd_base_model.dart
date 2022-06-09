import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

import '../screens/mm_busy_screen.dart';

class PRDBaseModel extends Model {
  late BuildContext scaffoldContext;
  late BuildContext globalContext;
  static PageRoute? busyRoute;

  bool _showingSnackBar = false;

  showBusy(BuildContext mainContext, bool show) {
    if (show) {
      busyRoute = PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => const PRDBusyScreen(),
      );
      Navigator.of(mainContext).push(
        busyRoute!,
      );
    } else {
      if (busyRoute != null) {
        Navigator.of(mainContext).removeRoute(busyRoute!);
        busyRoute = null;
      }
    }
  }

  void showMessageString(ctx, String error,
      {Color color = const Color(0xff004FB6), int duration = 2}) {
    if (_showingSnackBar) {
      return;
    }
    _showingSnackBar = true;
    final Duration snackBarDuration = Duration(seconds: duration);
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(
        error,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: snackBarDuration,
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    ScaffoldMessenger.of(ctx).showSnackBar(snackBar);
    Future.delayed(snackBarDuration, () {
      _showingSnackBar = false;
    });
  }
}
