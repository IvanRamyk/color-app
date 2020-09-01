import 'dart:math';
import 'dart:ui';

class ColorService  {

  // Returns random color with 100% opacity
  static Color randomColor()  {
    return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  }
}