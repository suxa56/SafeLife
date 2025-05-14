import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Talker get talker => TalkerFlutter.init();

  @lazySingleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @lazySingleton
  FirebaseDatabase get database {
    var instance = FirebaseDatabase.instance;
    instance.setPersistenceEnabled(true);
    return instance;
  }
}
