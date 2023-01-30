
import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/utils/functions.dart';

class SuperHeroConnectionsDetails extends StatelessWidget {
  final SuperHero hero;

  const SuperHeroConnectionsDetails({required this.hero}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Team Affiliation",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.connections?.groupAffiliation),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Relatives",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.connections?.relatives)
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}