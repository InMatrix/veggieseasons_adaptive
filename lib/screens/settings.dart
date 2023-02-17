import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
          delegate: SliverChildListDelegate(
              // // The builder function returns a ListTile with a title that
              // // displays the index of the current item.
              // (context, index) => ListTile(title: Text('Item #$index')),
              // // Builds 1000 ListTiles
              // childCount: 1000,
              [
                ListTile(
                  leading: Icon(
                    Icons.track_changes_outlined,
                    size: 32.0,
                  ),
                  title: Text("Calorie Target"),
                  trailing: Text("2000"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.favorite_outline_rounded,
                    size: 32.0,
                  ),
                  title: Text("Preferred Categories"),
                  subtitle: Text("What types of veggies you prefer!"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.delete_outline_rounded,
                    size: 32.0,
                  ),
                  title: Text("Restore Defaults"),
                  // TODO: try https://pub.dev/packages/adaptive_dialog
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text(
                          'Are you sure you want to reset the current settings?'),
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
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
