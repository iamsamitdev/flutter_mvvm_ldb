// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/view/home/HomeScreen.dart';
import 'themes/AppContextExtension.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: context.resources.color.colorPrimary
        ).copyWith(secondary: context.resources.color.colorAccent)
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id:(context) => HomeScreen()
      },
    );
  }
}