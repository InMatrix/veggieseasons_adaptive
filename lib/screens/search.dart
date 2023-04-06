import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/data/veggie_data.dart';
import 'package:veggieseasons_adaptive/widgets/veggie_headline.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;
  late String terms;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    terms = "";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    setState(() => terms = value);
  }

  Widget _createSearchBox() {
    if (Platform.isIOS) {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: 38.0,
          child: TextField(
            controller: _controller,
            autofocus: true,
            cursorColor: CupertinoColors.activeBlue,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              filled: true,
              fillColor: CupertinoColors.lightBackgroundGray,
              contentPadding: EdgeInsets.symmetric(vertical: 0.0),
              hintStyle: TextStyle(color: CupertinoColors.secondaryLabel),
              prefixIconColor: CupertinoColors.secondaryLabel,
            ),
            onChanged: _onTextChanged,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Search',
          ),
          onChanged: _onTextChanged,
        ),
      );
    }
  }

  List<Veggie> _searchVeggies(String terms) => veggies
      .where((v) => v.name.toLowerCase().contains(terms.toLowerCase()))
      .toList();

  Widget _buildSearchResults(List<Veggie> veggies) {
    if (veggies.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'No veggies matching your search terms were found.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }

    return ListView.builder(
      restorationId: 'list',
      itemCount: veggies.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          child: VeggieHeadline(veggies[i]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _createSearchBox(),
          Expanded(
            child: _buildSearchResults(
                // if the search team is not empty, filter results.
                terms.isNotEmpty ? _searchVeggies(terms) : veggies),
          ),
        ],
      ),
    );
  }
}
