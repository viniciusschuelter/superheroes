import 'package:flutter/material.dart';
import 'package:superheroes/models/super_hero_model.dart';
import 'package:superheroes/providers/super_heroes_provider.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/utils/const.dart';
import 'package:superheroes/widgets/super_heroes_card.dart';
import 'package:superheroes/widgets/super_heroes_search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  String searchTerm = '';
  int pageSize = 10;
  int cardSize = 140;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      var offset = _controller.offset;
      var bodyHeight = MediaQuery.of(context).size.height;
      if (offset > (cardSize * pageSize) - bodyHeight) {
        setState(() {
          pageSize += 10;
        });
      }
    });
    Provider.of<SuperHeroesProvider>(context, listen: false)
        .getAllSuperHeroes();
  }

  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<SuperHeroesProvider>(context, listen: false)
        .getAllSuperHeroes();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SuperHeroesProvider>(context);
    final List<SuperHero>  heroesList = data.heroesList;

    var count = heroesList.length;
    debugPrint('count: $count');

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(Constants.appName),
        // foregroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 4),
              width: MediaQuery.of(context).size.width,
              child: SuperHeroesSearchBar(
                onTextChanged: (value) => setState(() {
                  searchTerm = value;
                  debugPrint('value: $value');
                })
              ),
            ),
            Expanded(
              child: data.isLoading
                  ? Center(child: Image.asset('images/super-heroes.gif'))
                  : RefreshIndicator(
                      onRefresh: () => _refreshData(context),
                      child: ListView(
                        controller: _controller,
                        padding: EdgeInsets.only(top: 20),
                        children: [
                          Column(
                            children: heroesList
                                .map((item) => HeroCard(item, context))
                                .where((el) => el.hero.name!.toLowerCase().contains(searchTerm.toLowerCase()))
                                .take(pageSize)
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
