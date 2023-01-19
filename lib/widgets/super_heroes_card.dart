
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  final dynamic hero;
  final BuildContext context;

  const HeroCard(this.hero, this.context);

  @override
  Widget build(BuildContext context) {
    var name = hero.name;
    debugPrint('name: $name');

    return GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed(routeName, arguments: hero.id);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
          margin: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5),
          decoration: BoxDecoration(
            color: Color.fromARGB(0, 209, 209, 209),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(0, 209, 209, 209).withOpacity(0.5),
                blurRadius: 5,
                offset: Offset(2, 3),
              ),
            ],
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#' + hero.id.toString(),
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                ),
                Text(
                  hero.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    // if (hero.type1 != null) TypeCard(poke.type1),
                    SizedBox(width: 5),
                    // if (hero.type2 != null) TypeCard(poke.type2),
                  ],
                )
              ],
            ),
            Positioned(
              right: -15,
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(hero.images.sm)
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
