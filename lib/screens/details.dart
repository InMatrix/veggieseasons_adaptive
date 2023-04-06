// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/styles.dart';
import 'package:veggieseasons_adaptive/widgets/info_view.dart';
import 'package:veggieseasons_adaptive/widgets/trivia_view.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen(this.veggie, {super.key});

  /// Veggie to be displayed by the bottom sheet.
  final Veggie veggie;

  Widget _buildHeader() {
    return SizedBox(
      height: 150,
      child: Image.asset(
        veggie.imageAssetPath,
        fit: BoxFit.cover,
        semanticLabel: 'A background image of ${veggie.name}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 720,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHeader(),
          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
          DetailsSections(veggie: veggie),
        ],
      ),
    );
  }
}

class DetailsSections extends StatefulWidget {
  DetailsSections({Key? key, required this.veggie}) : super(key: key);
  final Veggie veggie;

  @override
  State<DetailsSections> createState() => _DetailsSectionsState();
}

enum DetailsSection { facts, trivia }

class _DetailsSectionsState extends State<DetailsSections> {
  DetailsSection sectionView = DetailsSection.facts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedButton<DetailsSection>(
          style: Platform.isIOS ? Styles.iOSSegmentedButtonStyle : null,
          showSelectedIcon: Platform.isIOS ? false : true,
          segments: const [
            ButtonSegment<DetailsSection>(
              value: DetailsSection.facts,
              label: Text('Facts & Info'),
            ),
            ButtonSegment<DetailsSection>(
              value: DetailsSection.trivia,
              label: Text('Trivia'),
            ),
          ],
          selected: <DetailsSection>{sectionView},
          onSelectionChanged: (Set<DetailsSection> newSelection) {
            setState(() {
              sectionView = newSelection.first;
            });
          },
        ),
        if (sectionView == DetailsSection.facts)
          InfoView(widget.veggie)
        else
          TriviaView(widget.veggie),
      ],
    );
  }
}
