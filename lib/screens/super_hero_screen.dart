import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/utils/const.dart';
import 'package:superheroes/widgets/super_heroes_details.dart';

class SuperHeroScreen extends StatefulWidget {
  static const routeName = '/heroDetails';

  @override
  _SuperHeroScreenState createState() => _SuperHeroScreenState();
}

class _SuperHeroScreenState extends State<SuperHeroScreen> {

  @override
  Widget build(BuildContext context) {
  final SuperHero hero = ModalRoute.of(context)?.settings.arguments as SuperHero;
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.detailsName),
        foregroundColor: Colors.red,
      ),
      body: HeroDetails(hero, context),
    );
  }
}