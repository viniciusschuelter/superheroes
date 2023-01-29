import 'package:flutter/material.dart';
import 'package:superheroes/providers/super_heroes_provider.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/utils/const.dart';
import 'package:superheroes/widgets/super_heroes_card.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName),
        foregroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                .take(50)
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
