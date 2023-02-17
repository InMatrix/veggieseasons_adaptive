import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:veggieseasons_adaptive/data/veggie_data.dart';
import 'package:veggieseasons_adaptive/widgets/veggie_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var dateString = DateFormat('MMMM y').format(DateTime.now());

    return Scaffold(
      body: <Widget>[
        _buildVeggieList(dateString),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('TODO: My Garden'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('TODO: Search'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('TODO: Settings'),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'My Garden',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
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
                  Text(
                    "In season today",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            );
          } else if (index <= veggies.length) {
            return VeggieCard(veggies[index]);
          }
        },
      ),
    );
  }
}
