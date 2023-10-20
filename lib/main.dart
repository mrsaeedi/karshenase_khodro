import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:karshenase_khodro/components/theme_data.dart';
import 'package:karshenase_khodro/home.dart';
import 'models/automative_expert_cheklist_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(AutomativeExpertModelAdapter());
  await Hive.openBox<Car>('carBox');
  await Hive.openBox<AutomativeExpertModel>('autoBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("fa", "IR"),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
