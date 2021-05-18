import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController{
  bool english = true;
  
  updateLocale(){
    Get.updateLocale(Locale(english ? 'en_US': 'ru_RU'));
    english = !english;
  }
}