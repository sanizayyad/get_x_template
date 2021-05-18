import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/translation_controller.dart';
import 'core/values/translations/app_translations.dart';
import 'routes/app_pages.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialBinding: BindingsBuilder(()=>{
          Get.put(TranslationController()),
      }),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      translationsKeys: AppTranslation.translations,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
