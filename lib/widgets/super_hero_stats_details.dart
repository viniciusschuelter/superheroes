

import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superheroes/utils/functions.dart';

class SuperHeroStatsDetails extends StatelessWidget {
  final SuperHero hero;


  const SuperHeroStatsDetails({required this.hero}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Intelligence" + " - ${defaultDynamicValue(hero.powerstats?.intelligence)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.intelligence?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.blue,
          ),
        ),
        ListTile(
          title: Text(
            "Strength" + " - ${defaultDynamicValue(hero.powerstats?.strength)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.strength?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orange,
          ),
        ),
        ListTile(
          title: Text(
            "Speed" + " - ${defaultDynamicValue(hero.powerstats?.speed)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.speed?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text(
            "Durability" + " - ${defaultDynamicValue(hero.powerstats?.durability)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.durability?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.orangeAccent,
          ),
        ),
        ListTile(
          title: Text(
            "Power" + " - ${defaultDynamicValue(hero.powerstats?.power)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.power?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.red,
          ),
        ),
        ListTile(
          title: Text(
            "Combat" + " - ${defaultDynamicValue(hero.powerstats?.combat)}%",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 5000,
            percent: defaultDynamicValue(hero.powerstats?.combat?.toDouble()) / 100.0,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Colors.black,
          ),
        ),
      ],
    );
  }
}