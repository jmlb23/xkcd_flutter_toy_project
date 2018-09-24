library model.types;

import 'package:http/http.dart';
import 'dart:convert';

class Comic{
  
  num month;
  num editionNumber;
  String link;
  num year;
  String news;
  String safeTitle;
  String alt;
  String urlImg;
  String title;
  String transcript;
  num day;

  Comic();
}

Comic toJson(json) {
    final map = jsonDecode(json);
    final comic = Comic();

    return comic
                  ..month = num.parse(map['month'])
                  ..editionNumber = map['num']
                  ..link = map['link']
                  ..year = num.parse(map['year'])
                  ..news = map['news']
                  ..safeTitle = map['safe_title']
                  ..transcript = map['transcript']
                  ..alt = map['alt']
                  ..urlImg = map['img']
                  ..title = map['title']
                  ..day = num.parse(map['day']);
  }