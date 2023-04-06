import 'dart:io';

import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/styles.dart';
import 'package:veggieseasons_adaptive/screens/details.dart';

class ZoomClipAssetImage extends StatelessWidget {
  const ZoomClipAssetImage({
    required this.zoom,
    this.height,
    this.width,
    required this.imageAsset,
    super.key,
  });

  final double zoom;
  final double? height;
  final double? width;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: OverflowBox(
          maxHeight: height! * zoom,
          maxWidth: width! * zoom,
          child: Image.asset(
            imageAsset,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class VeggieHeadline extends StatelessWidget {
  final Veggie veggie;

  const VeggieHeadline(this.veggie, {super.key});
  List<Widget> _buildSeasonDots(List<Season> seasons) {
    var widgets = <Widget>[];

    for (var season in seasons) {
      widgets.add(const SizedBox(width: 4));
      widgets.add(
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Styles.seasonColors[season],
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return DetailsScreen(veggie);
          },
        );
      },
      // build each item using either `_itemRow` or `_itemListTile`
      child: Platform.isIOS ? _itemRow(themeData) : _itemListTile(themeData),
    );
  }

  // Build a veggie item using the Row and Column widgets
  // This is the same code from the original Veggie Seasons
  Row _itemRow(ThemeData themeData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZoomClipAssetImage(
          imageAsset: veggie.imageAssetPath,
          zoom: 2.4,
          height: 72,
          width: 72,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    veggie.name,
                    style: themeData.textTheme.headlineSmall,
                  ),
                  ..._buildSeasonDots(veggie.seasons),
                ],
              ),
              Text(
                veggie.shortDescription,
                style: themeData.textTheme.bodyLarge,
              ),
            ],
          ),
        )
      ],
    );
  }

  // Build a veggie item using the ListTile widget
  // This is easier if the app sticks to Material Design.
  ListTile _itemListTile(ThemeData themeData) {
    return ListTile(
      leading: ZoomClipAssetImage(
        imageAsset: veggie.imageAssetPath,
        zoom: 2.4,
        height: 72,
        width: 72,
      ),
      title: Row(
        children: [
          Text(
            veggie.name,
            style: themeData.textTheme.headlineSmall,
          ),
          ..._buildSeasonDots(veggie.seasons),
        ],
      ),
      subtitle: Text(
        veggie.shortDescription,
        style: themeData.textTheme.bodyLarge,
      ),
    );
  }
}
