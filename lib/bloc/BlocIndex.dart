import 'package:xkcd_toy_app/model/api/ApiClient.dart';

getElement(num number) {
  return number > 0 ? ApiClient.getElementByNumber(number) : ApiClient.getCurrentElement();
}