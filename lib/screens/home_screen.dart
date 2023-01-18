import 'package:flutter/material.dart';
import 'package:superheroes/providers/super_heroes_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SuperHeroesProvider>(context, listen: false)
        .getAllSuperHeroes();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<SuperHeroesProvider>(context, listen: false)
        .getAllSuperHeroes();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SuperHeroesProvider>(context);
    final heroesList = data.heroesList;

    var count = heroesList.length;
    debugPrint('count: $count');
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(bottom: 15),
            //   height: MediaQuery.of(context).size.width / 1.5,
            //   width: MediaQuery.of(context).size.width,
            //   // child: HomeSearch(),
            // ),
            Expanded(
              child: data.isLoading
                  ? Center(child: Image.asset('images/super-heroes.gif'))
                  : RefreshIndicator(
                      onRefresh: () => _refreshData(context),
                      child: ListView(
                        padding: EdgeInsets.only(top: 20),
                        children: [
                          Column(
                            children: heroesList
                                .map((item) => HeroCard(item, context))
                                .take(5)
                                .toList(),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

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
            color: Color.fromARGB(0, 245, 240, 240),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(0, 245, 240, 240).withOpacity(0.5),
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
              right: -35,
              bottom: -50,
              child: FadeInImage.assetNetwork(
                placeholder: 'images/super-heroes.gif',
                image: hero.images.xs,
                imageScale: 0.5,
              ),
            ),
          ]
        ),
      )
    );
  }
}
