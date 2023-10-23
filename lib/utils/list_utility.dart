import 'package:flutter/material.dart';

class ListUtility {
  static EdgeInsets getHorizontalPaddingEdgeInsets(
          {required int totalLength,
          required int currentIndex,
          required double padding}) =>
      EdgeInsets.only(
        left: currentIndex == 0 ? 0 : padding / 2,
        right: currentIndex == (totalLength - 1) ? 0 : padding / 2,
      );
}
