import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/providers/super_heroes_provider.dart';
import 'package:superheroes/screens/super_hero_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SuperHeroesProvider(),
      child: MaterialApp(
        title: 'Flutter Super Heroes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(217, 61, 39, 1),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Color.fromRGBO(239, 165, 58, 1),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          SuperHeroScreen.routeName: (ctx) => SuperHeroScreen(),
        },
      ),
    );
  }
}
