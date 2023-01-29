import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/utils/functions.dart';

class SuperHeroBioDetail extends StatelessWidget {
  final SuperHero hero;

  const SuperHeroBioDetail({required this.hero}) : super();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Alter Ego(s)",
            // style: Theme.of(context).textTheme.caption?.copyWith(
            //       fontWeight: FontWeight.w500,
            //     ),
          ),
          subtitle: Text(
            defaultStringValue(hero.biography?.alterEgos),
            style: TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Aliases",
            style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            hero.biography!.aliases
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", ""),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Place of birth",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.biography?.placeOfBirth),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "First Appearance",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.biography?.firstAppearance),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        ListTile(
          title: Text(
            "Creator",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            defaultStringValue(hero.biography?.publisher),
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
