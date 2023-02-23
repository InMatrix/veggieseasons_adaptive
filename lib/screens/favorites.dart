import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/data/veggie_data.dart';
import 'package:veggieseasons_adaptive/widgets/veggie_headline.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  List<Veggie> get favoriteVeggies =>
      veggies.where((v) => v.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: favoriteVeggies.isEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'You haven\'t added any favorite veggies to your garden yet.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView(
              children: [
                const SizedBox(height: 24),
                for (Veggie veggie in favoriteVeggies)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: VeggieHeadline(veggie),
                  ),
              ],
            ),
    );
  }
}
