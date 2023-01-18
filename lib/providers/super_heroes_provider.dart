import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:superheroes/models/super_hero_model.dart';

class SuperHeroesProvider with ChangeNotifier {
  bool isLoading = false;
  bool isRequestError = false;
  List<SuperHero> heroesList = [];

  Future<void> getAllSuperHeroes() async {
    isRequestError = false;
    
    try {
      isLoading = true;
      Uri url = Uri.parse('https://akabab.github.io/superhero-api/api/all.json');
      final response = await http.get(url);
      final responseData = json.decode(response.body) as List<dynamic>;
      responseData.map((element) => SuperHero.fromJson(element));
      isLoading = false;
      notifyListeners();
      inspect(heroesList);
    } catch (e) {
      isRequestError = true;
      throw (e);
    }
  }
}