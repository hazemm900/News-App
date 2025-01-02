import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:news_app/app.dart';
import 'package:news_app/core/helper/bloc_observer.dart';
import 'package:news_app/core/helper/firebase_options.dart';
import 'package:news_app/core/helper/sheared_preference.dart';
import 'package:news_app/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: Phoenix(
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => const MyApp(), // Wrap your app
        ),
      )));
}
