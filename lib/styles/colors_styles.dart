import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => Color(0XFF791435);
  Color get azulpetroleo => Color(0XFF084d6e);
  Color get black => Color.fromARGB(255, 3, 3, 3);
  Color get white => Color(0XFFffffff);
  Color get green => Color(0XFF008000);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
