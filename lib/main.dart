//import 'package:cinelist/ui/login_page.dart';
import 'package:cinelist/ui/home_page.dart';
import 'package:cinelist/ui/search_page.dart';
import 'package:cinelist/ui/detail_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineList',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
        //home: const MovieDetailPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/search': (context) => const SearchPage(),
        },
      debugShowCheckedModeBanner: false
    );
  }
}


