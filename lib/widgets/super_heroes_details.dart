import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/widgets/super_hero_appearance_details.dart';
import 'package:superheroes/widgets/super_hero_bio_detail.dart';


class Details extends StatefulWidget {
  final SuperHero hero;

  Details({required this.hero}) : super();

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SuperheroDetails(hero: widget.hero, context: context);
  }
}

class SuperheroDetails extends StatefulWidget {
  final SuperHero hero;
  final BuildContext context;

  const SuperheroDetails({super.key, required this.hero, required this.context});

  @override
  _SuperheroDetailsState createState() => _SuperheroDetailsState();
}


class _SuperheroDetailsState extends State<SuperheroDetails> {
    late final dynamic hero;
    Map<String, bool> mapExpansionList = Map<String, bool>();
    bool checkExpansion(String key) {
      return mapExpansionList[key] == true ? true : false;
   }

    @override
    void initState() {
      super.initState();
      hero = super.widget.hero;

      mapExpansionList.addAll({
        "Biography": true,
        "Appearance": false,
        "Work": false,
        "Power Stats": false,
        "Connections": false,
      });
    }
    
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Hero(
              tag: hero.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(image: NetworkImage(hero.images.sm)),
              )
            ),
            SizedBox(height: 24),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  mapExpansionList[mapExpansionList.keys
                      .toList()[index]] = !isExpanded;
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Biography",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: SuperHeroBioDetail(hero: this.hero),
                    isExpanded: checkExpansion('Biography')
                ),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Appearance",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: SuperHeroAppearanceDetail(hero: this.hero),
                    isExpanded: checkExpansion('Appearance')
                    ),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Work",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Text("Work works"),
                    isExpanded: checkExpansion('Work')
                    ),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Power Stats",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Text("Power Stats works"),
                    isExpanded: checkExpansion('Power Stats')
                    ),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Connections",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Text("Connections works"),
                    isExpanded: checkExpansion('Connections')
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

