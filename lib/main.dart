import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voa_news/voa/home/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "VOA Burmese",
    theme: ThemeData(
        fontFamily: "Pyidaungsu",
        scaffoldBackgroundColor: Colors.indigo.shade100,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(58, 121, 183, 1))),
    home: HomePage(),
  ));
}
