
import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/utils/functions.dart';

class SuperHeroWorkDetails extends StatelessWidget {
  final SuperHero hero;

  const SuperHeroWorkDetails({required this.hero}) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Base",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        defaultStringValue(hero.work?.base),
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }
}
