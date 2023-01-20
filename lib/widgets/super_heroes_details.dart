import 'package:flutter/material.dart';
import 'package:superheroes/screens/super_hero_screen.dart';

class HeroDetails extends StatelessWidget {
  final dynamic hero;
  final BuildContext context;

  const HeroDetails(this.hero, this.context);

  @override
  Widget build(BuildContext context) {
    Map<String, bool> mapExpansionList = Map<String, bool>();
    mapExpansionList.addAll({
      "Biography": true,
      "Appearance": false,
      "Work": false,
      "Power Stats": false,
      "Connections": false,
    });

    var bio = mapExpansionList["Biography"];

    debugPrint('$bio');

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Hero(
              tag: hero.id,
              child: Positioned(
                  top: -8,
                  right: -8,
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
            ),
            SizedBox(
              height: 13.0,
            ),
            Text(
              hero.name,
              // style: textTheme.headline6,
            ),
            Text(
              hero.biography.fullName.isEmpty? hero.name : hero.biography.fullName,
              // style: textTheme.subtitle1.copyWith(
              //   fontWeight: FontWeight.w300,
              // ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                var key = mapExpansionList.keys.toList()[index];
                  debugPrint('$index, $isExpanded, $key');
                  mapExpansionList[mapExpansionList.keys.toList()[index]] = !isExpanded;
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
                    body: Text("Biography works"),
                    isExpanded: mapExpansionList["Biography"] == true ? true :
                ),
                ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                          title: Text(
                        "Appearance",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ));
                    },
                    body: Text("Appearance works"),
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
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

