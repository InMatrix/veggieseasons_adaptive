import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/styles.dart';

class InfoView extends StatelessWidget {
  const InfoView(this.veggie, {super.key});

  /// Veggie to be displayed by the card.
  final Veggie veggie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                veggie.categoryName!.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const Spacer(),
              for (Season season in veggie.seasons) ...[
                const SizedBox(width: 12),
                Padding(
                  padding: Styles.seasonIconPadding[season]!,
                  child: Icon(
                    Styles.seasonIconData[season],
                    semanticLabel: seasonNames[season],
                    color: Styles.seasonColors[season],
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            veggie.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 8),
          Text(
            veggie.shortDescription,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ServingInfoChart(veggie),
          const SizedBox(height: 24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Switch.adaptive(
                value: veggie.isFavorite,
                onChanged: (value) {
                  // TODO: save favorite
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Save to Garden',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServingInfoChart extends StatelessWidget {
  const ServingInfoChart(this.veggie, {super.key});

  final Veggie veggie;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 9,
              bottom: 4,
            ),
            child: Text(
              'Serving info',
              style: themeData.textTheme.bodyLarge,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Serving size:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          veggie.servingSize,
                          textAlign: TextAlign.end,
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Calories:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '${veggie.caloriesPerServing} kCal',
                          style: themeData.textTheme.bodyLarge,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Vitamin A:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(veggie.vitaminAPercentage.toString()),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          'Vitamin C:',
                          style: themeData.textTheme.bodyLarge,
                        ),
                      ),
                      TableCell(
                        child: Text(veggie.vitaminCPercentage.toString()),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Percent daily values based on a diet of '
                  '2,000 calories.',
                  style: themeData.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
