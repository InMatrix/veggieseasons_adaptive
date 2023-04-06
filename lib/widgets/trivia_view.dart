import 'dart:io';

import 'package:flutter/material.dart';
import 'package:veggieseasons_adaptive/data/veggie.dart';
import 'package:veggieseasons_adaptive/styles.dart';

class TriviaView extends StatelessWidget {
  const TriviaView(this.veggie, {super.key});
  final Veggie veggie;

  Trivia get currentTrivia => veggie.trivia[0];

  // Presents the current trivia's question and answer choices.
  Widget _buildQuestionView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            currentTrivia.question,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          for (int i = 0; i < currentTrivia.answers.length; i++)
            Padding(
                padding: const EdgeInsets.all(8),
                child: FilledButton(
                  style: Platform.isIOS ? Styles.iOSButtonStyle : null,
                  child: Text(
                    currentTrivia.answers[i],
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => null,
                )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildQuestionView(context),
    );
  }
}
