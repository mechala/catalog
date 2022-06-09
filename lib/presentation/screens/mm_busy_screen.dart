import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui' as ui;

import '../../business_logic/prd_app_colors.dart';

class PRDBusyScreen extends StatelessWidget {
  const PRDBusyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: PRDAppColors.deepPurple,
            ),
          );
        },
      ),
    ]);
  }
}
