
import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/screens/super_hero_screen.dart';
import 'package:superheroes/utils/functions.dart';

class HeroCard extends StatelessWidget {
  final SuperHero hero;
  final BuildContext context;

  const HeroCard(this.hero, this.context);

  @override
  Widget build(BuildContext context) {
    // var name = hero.name;
    // debugPrint('name: $name');

    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(SuperHeroScreen.routeName, arguments: hero);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
          margin: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
            color: Color.fromRGBO(185, 190, 186, 1),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#' + hero.id.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                Text(
                  defaultStringValue(hero.name),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.type_specimen,
                      size: 12,
                      color: Color.fromRGBO(204, 244, 254, 1)
                    ),
                    SizedBox(
                      width: 2.0,
                    ),
                    Flexible(
                      child: Text(defaultStringValue(hero.biography?.publisher),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(204, 244, 254, 1)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(defaultStringValue(hero.images?.sm))
                    )
                )
              ),
            ),
          ]
        ),
      )
    );
  }
}
