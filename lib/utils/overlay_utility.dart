import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OverlayUtility {
  static SystemUiOverlayStyle getStatusBarOverlayStyles() {
    return SystemUiOverlayStyle(
      statusBarColor: defaultTargetPlatform != TargetPlatform.iOS
          ? Colors.deepOrange
          : null,
      statusBarIconBrightness:
          defaultTargetPlatform != TargetPlatform.iOS ? Brightness.light : null,
    );
  }
}
