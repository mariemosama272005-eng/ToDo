import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/feature/login/data/user_model.dart';
import 'package:to_do_app/toDo_app.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   await Hive.initFlutter();
   Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("UserBox");
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', 
      fallbackLocale: Locale('en', 'US'),
    child: const TodoApp()));
}

