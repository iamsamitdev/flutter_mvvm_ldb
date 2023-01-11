// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'colors/AppColors.dart';
import 'dimensions/AppDimension.dart';
import 'strings/EnglishStrings.dart';
import 'strings/ThaiStrings.dart';
import 'strings/Strings.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'th':
        return ThaiStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}