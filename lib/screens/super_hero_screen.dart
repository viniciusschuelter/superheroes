import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/utils/const.dart';
import 'package:superheroes/widgets/super_heroes_card.dart';

class SuperHeroScreen extends StatefulWidget {
  static const routeName = '/heroDetails';

  @override
  _SuperHeroScreenState createState() => _SuperHeroScreenState();
}

class _SuperHeroScreenState extends State<SuperHeroScreen> {

  @override
  Widget build(BuildContext context) {
  final SuperHero hero = ModalRoute.of(context)?.settings.arguments as SuperHero;
  debugPrint('hero: $hero');
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
        foregroundColor: Colors.red,
        
      ),
      body: HeroCard(hero, context),
    );
  }
}