import 'package:flutter/material.dart';
import 'package:superheroes/screens/super_hero_screen.dart';

class SuperHeroesSearchBar extends StatefulWidget {
  final ValueChanged<String> onTextChanged;

  SuperHeroesSearchBar({required this.onTextChanged}) : super();

  @override
  _SuperHeroesSearchBarState createState() => _SuperHeroesSearchBarState();
}

class _SuperHeroesSearchBarState extends State<SuperHeroesSearchBar> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: TextStyle(color: Colors.black),
        maxLines: 1,
        controller: _textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600]),
          errorText: _validate ? null : null,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          hintText: "What Super Hero are you looking for? ",
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.onTextChanged(value);
          }
        },
      ),
    );
  }
}