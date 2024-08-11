import 'dart:convert';

String decodeText(String text) {
    return utf8.decode(text.runes.toList());
  }

  String convertToUpperCase(String text) {
    return text.toUpperCase().replaceAllMapped(RegExp(r'[äöüõ]'), (match) {
      switch (match[0]) {
        case 'ä':
          return 'Ä';
        case 'ö':
          return 'Ö';
        case 'ü':
          return 'Ü';
        case 'õ':
          return 'Õ';
        default:
          return match[0]!.toUpperCase();
      }
    });
  }


 