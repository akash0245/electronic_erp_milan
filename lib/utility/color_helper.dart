import 'package:flutter/material.dart';
import 'dimen_helper.dart';

class ColorHelper {
  static const Color grey = Color(0xFF3A5160);
  static Color background = DimenHelper.bodyPage_BackgroundColor;
  static const Color white = Color(0xFFF2F3F8);
  static const Color black = Color(0xFF000000);
  static const Color blue = Colors.blue;
  static const Color darkTextColor = Color(0xFF333333);
  static const Color whiteBackGround = Color(0xFFE9EAF0);


  static getColor(int i) {
    int colorIndex = i;
    if (i > 4) {
      colorIndex = i % 5;
    }

    if (colorIndex == 0) {
      return const Color(0xFF2574ab);
    } else if (colorIndex == 1) {
      return const Color(0xFFd9534f);
    } else if (colorIndex == 2) {
      return const Color(0xFFe6ad5c);
    } else if (colorIndex == 3) {
      return const Color(0xFF7A9045);
    } else if (colorIndex == 4) {
      return const Color(0xFF259dab);
    } else if (colorIndex == 5) {
      return const Color(0xFF259dab);
    }
  }

  static Color iconColor1() {
    return const Color(0xff06c289);
  }

  static Color iconColor2() {
    return Color(0xFFd9534f);
  }

  static Color iconColor3() {
    return Color(0xFF7A9045);
  }

  static Color iconColor4() {
    return Color(0xFF259dab);
  }

  static Color getStatusColor(int value) {
    Color statusColor = Color(0xFFd9534f);
    if (value == 1) {
      statusColor = Color(0xFFd9534f);
    } else if (value == 2) {
      statusColor = Color(0xFFe6ad5c);
    } else if (value == 3) {
      statusColor = Color(0xFF259dab);
    }
    return statusColor;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
