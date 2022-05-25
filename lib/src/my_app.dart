import 'package:flutter/material.dart';
import 'package:jogodavelha/src/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo),
      home: HomeView(),
    );
  }
}
