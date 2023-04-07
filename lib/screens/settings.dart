import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';

import '../styles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  void _showResetDialog(context,
      {required String title, required String content}) {
    if (Platform.isIOS) {
      showCupertinoDialog<void>(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Yes'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('No'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Yes'),
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'No'),
              child: const Text('No'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          surfaceTintColor: Colors.transparent,
          toolbarHeight: 44,
          collapsedHeight: 44,
          expandedHeight: 117,
          title: Text("Settings", style: Styles.headlineText(themeData)),
          // flexibleSpace: FlexibleSpaceBar(
          //   title: Text("Settings", style: themeData.textTheme.titleMedium),
          //   expandedTitleScale: 2.0,
          //   centerTitle: false,
          // ),
        ),
        SliverList(
          // Use a delegate to build items as they're scrolled on screen.
          delegate: SliverChildListDelegate([
            ListTile(
              leading: Icon(
                Icons.track_changes_outlined,
                size: 32.0,
              ),
              title: Text("Calorie Target"),
              trailing: Text("2000"),
              onTap: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("This page is under construction"),
                  ),
                )
              },
            ),
            ListTile(
              leading: Icon(
                Icons.favorite_outline_rounded,
                size: 32.0,
              ),
              title: Text("Preferred Categories"),
              subtitle: Text("What types of veggies you prefer!"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VeggieCategorySettingsScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline_rounded,
                size: 32.0,
              ),
              title: Text("Restore Defaults"),
              onTap: () => _showResetDialog(context,
                  title: "Are you sure?",
                  content:
                      "Are you sure you want to reset the current settings?"),
            ),
          ]),
        ),
      ],
    );
  }
}

class VeggieCategorySettingsScreen extends StatelessWidget {
  const VeggieCategorySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferred Categories"),
      ),
      body: ListView(
        children: [
          for (var item in VeggieCategory.values)
            Column(
              children: [
                ListTile(
                  title: Text(item.name,
                      style: Theme.of(context).textTheme.bodyLarge),
                  trailing: Switch.adaptive(
                    value: false,
                    onChanged: (value) => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("The switch doesn't work yet."),
                        ),
                      ),
                    },
                  ),
                ),
                Divider(),
              ],
            )
        ],
      ),
    );
  }
}
