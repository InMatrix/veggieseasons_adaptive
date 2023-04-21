import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';

import 'package:veggieseasons_adaptive/data/veggie_data.dart';
import 'package:veggieseasons_adaptive/screens/favorites.dart';
import 'package:veggieseasons_adaptive/screens/search.dart';
import 'package:veggieseasons_adaptive/screens/settings.dart';
import 'package:veggieseasons_adaptive/styles.dart';
import 'package:veggieseasons_adaptive/widgets/veggie_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  final Map<String, Icon> _navigationItems = {
    'Home': Platform.isIOS ? Icon(CupertinoIcons.home) : Icon(Icons.home),
    'My Garden': Platform.isIOS
        ? Icon(CupertinoIcons.book)
        : Icon(Icons.bookmark_border),
    'Search': Platform.isIOS ? Icon(CupertinoIcons.search) : Icon(Icons.search),
    'Settings':
        Platform.isIOS ? Icon(CupertinoIcons.settings) : Icon(Icons.settings),
  };

  Season? _getSeasonForDate(DateTime date) {
    // Technically the start and end dates of seasons can vary by a day or so,
    // but this is close enough for produce.
    switch (date.month) {
      case 1:
        return Season.winter;
      case 2:
        return Season.winter;
      case 3:
        return date.day < 21 ? Season.winter : Season.spring;
      case 4:
        return Season.spring;
      case 5:
        return Season.spring;
      case 6:
        return date.day < 21 ? Season.spring : Season.summer;
      case 7:
        return Season.summer;
      case 8:
        return Season.summer;
      case 9:
        return date.day < 22 ? Season.autumn : Season.winter;
      case 10:
        return Season.autumn;
      case 11:
        return Season.autumn;
      case 12:
        return date.day < 22 ? Season.autumn : Season.winter;
      default:
        throw ArgumentError('Can\'t return a season for month #${date.month}.');
    }
  }

  List<Veggie> get availableVeggies {
    var currentSeason = _getSeasonForDate(DateTime.now());
    return veggies.where((v) => v.seasons.contains(currentSeason)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var dateString = DateFormat('MMMM y').format(DateTime.now());

    return Scaffold(
      body: <Widget>[
        _buildVeggieList(dateString),
        FavoritesScreen(),
        SearchScreen(),
        SettingScreen(),
      ][currentPageIndex],
      bottomNavigationBar: Platform.isIOS
          ? CupertinoTabBar(
              currentIndex: currentPageIndex,
              onTap: (index) {
                setState(() => currentPageIndex = index);
              },
              items: _navigationItems.entries
                  .map<BottomNavigationBarItem>(
                      (entry) => BottomNavigationBarItem(
                            icon: entry.value,
                            label: entry.key,
                          ))
                  .toList(),
            )
          : NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              selectedIndex: currentPageIndex,
              destinations: _navigationItems.entries
                  .map<Widget>((entry) => NavigationDestination(
                        icon: entry.value,
                        label: entry.key,
                      ))
                  .toList(),
            ),
      appBar: currentPageIndex == 1 ? AppBar(title: Text("My Garden")) : null,
    );
  }

  Center _buildVeggieList(String dateString) {
    return Center(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateString.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("In season today",
                      style: Styles.headlineText(Theme.of(context))),
                ],
              ),
            );
          } else if (index <= availableVeggies.length) {
            return VeggieCard(availableVeggies[index - 1]);
          }
        },
      ),
    );
  }
}
