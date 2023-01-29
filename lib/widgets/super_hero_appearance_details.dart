
import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';

class SuperHeroAppearanceDetail extends StatelessWidget {
  final SuperHero hero;

  dynamic defaultStringValue(dynamic str) {
    return str != null ? str : '';
  }

  const SuperHeroAppearanceDetail({required this.hero}) : super();

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Gender",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.appearance?.gender),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Race",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.appearance?.race)
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Height",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.appearance?.height)
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Weight",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.appearance?.weight)
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Eye Color",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.appearance?.eyeColor),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}