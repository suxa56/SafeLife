import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/ui/app/app.dart';
import 'package:talker/talker.dart';

import 'di/injections.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // DI
    configureDependencies();
    // Gray Screen Error Handling
    FlutterError.onError = (details) => getIt<Talker>().handle(details);
    // Platform Error Handling
    PlatformDispatcher.instance.onError = (exception, stackTrace) {
      getIt<Talker>().handle(exception, stackTrace);
      return true;
    };
    // Run App
    runApp(const App());
  }, (error, stack) {
    getIt<Talker>().handle(error, stack);
  });
}

