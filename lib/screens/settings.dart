import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/adaptation_settings.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';

import '../styles.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  void _showResetDialog(context,
      {required String title, required String content}) {
    if (iOSAdaptation == AdaptationLevel.minimal) {
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
    } else {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Settings",
                style: Theme.of(context).textTheme.headlineLarge),
          ),
          // Make the initial height of the SliverAppBar larger than normal.
          expandedHeight: 100,
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
            Divider(),
            AdaptationLevelSelector(),
          ]),
        ),
      ],
    );
  }
}

class AdaptationLevelSelector extends StatefulWidget {
  const AdaptationLevelSelector({
    super.key,
  });

  @override
  State<AdaptationLevelSelector> createState() =>
      _AdaptationLevelSelectorState();
}

class _AdaptationLevelSelectorState extends State<AdaptationLevelSelector> {
  // var selectedAdaptationLevel = iOSAdaptation;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            "Platform adaptation level:",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10.0),
          SegmentedButton<AdaptationLevel>(
            style: iOSAdaptation == AdaptationLevel.minimal
                ? null
                : Styles.iOSSegmentedButtonStyle,
            showSelectedIcon:
                iOSAdaptation == AdaptationLevel.minimal ? true : false,
            segments: const [
              ButtonSegment<AdaptationLevel>(
                value: AdaptationLevel.minimal,
                label: Text('Minimal'),
              ),
              ButtonSegment<AdaptationLevel>(
                value: AdaptationLevel.some,
                label: Text('Some'),
              ),
              ButtonSegment<AdaptationLevel>(
                value: AdaptationLevel.more,
                label: Text('More'),
              ),
            ],
            selected: <AdaptationLevel>{iOSAdaptation},
            onSelectionChanged: (Set<AdaptationLevel> newSelection) {
              setState(() {
                // By default there is only a single segment that can be
                // selected at one time, so its value is always the first
                // item in the selected set.
                iOSAdaptation = newSelection.first;
              });
            },
          ),
        ],
      ),
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
                  trailing: iOSAdaptation == AdaptationLevel.minimal
                      ? Switch(
                          value: false,
                          onChanged: (value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text("The switch doesn't work yet."),
                              ),
                            ),
                          },
                        )
                      : Switch.adaptive(
                          value: false,
                          onChanged: (value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    const Text("The switch doesn't work yet."),
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
