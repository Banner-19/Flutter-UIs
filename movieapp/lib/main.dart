import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/pages/main_page.dart';
import 'package:movieapp/pages/splash_page.dart';

void main() {
  runApp(SplashPage(key: UniqueKey(),onInitialComplete: ()=>runApp(ProviderScope(child: MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieShow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: "home",
      routes: {
        "home":(BuildContext  _context)=> MainPage()
      },
    );
  }
}

