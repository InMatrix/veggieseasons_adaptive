import 'package:flutter/material.dart';

import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/screens/details.dart';
import 'package:veggieseasons_adaptive/styles.dart';

class VeggieCard extends StatelessWidget {
  const VeggieCard(this.veggie, {super.key});

  /// Veggie to be displayed by the card.
  final Veggie veggie;

  Widget _buildDetails(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: const Color(0x90ffffff),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              veggie.name,
              style: Styles.headlineText(themeData),
            ),
            Text(
              veggie.shortDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return DetailsScreen(veggie);
            },
          );
        },
        child: Stack(
          children: [
            // Image.asset('assets/images/apple.jpg'),
            Container(
              // height: isInSeason ? 300 : 150,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  // colorFilter: isInSeason ? null : Styles.desaturatedColorFilter,
                  image: AssetImage(
                    veggie.imageAssetPath,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildDetails(context),
            ),
          ],
        ),
      ),
    );
  }
}
