import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/providers/super_heroes_provider.dart';

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
            color: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          // HeroDetailScreen.routeName: (ctx) => HeroDetailScreen(),
        },
      ),
    );
  }
}
