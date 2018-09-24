library model.api;

import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import '../types/Comic.dart';
import 'dart:async';

class ApiClient{
  static Client client = Client();

  static Stream<Comic> getElement(url){

    return client.get(url).asStream().map((x) => x.body).first.asStream().map((x) => toJson(x));
  }
  
  static Stream<Comic> getCurrentElement() async*{
    yield await getElement("https://xkcd.com/info.0.json").first;
  }

  static Stream<Comic> getElementByNumber(number) async*{ 
    yield await getElement("https://xkcd.com/$number/info.0.json").first;
  }
  
}