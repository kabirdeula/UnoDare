import 'dart:math';

import 'package:uno_dare/data/models/cards/card_model.dart';

class UnoDeck {
  static const List<String> colors = ['red', 'blue', 'green', 'yellow'];
  static const List<String> actionCards = ['reverse', 'skip', 'draw two'];
  static const String wildCardValue = 'wild draw two';
  static const int numberCardCopies = 2;
  static const int actionCardCopies = 2;
  static const int wildCardCopies = 8;

  /// Generate a standard UNO deck (108 cards)
  static List<CardModel> generateDeck() {
    final List<CardModel> deck = [];

    // Add number cards (0-9 for each color, 1-9 twice)
    for (final color in colors) {
      deck.add(CardModel(color: color, value: '0', type: 'number')); // Single 0
      for (int i = 1; i <= 9; i++) {
        for (int j = 0; j < numberCardCopies; j++) {
          deck.add(CardModel(color: color, value: '$i', type: 'number'));
        }
      }
    }

    // Add action cards (2 of each for each color)
    for (final color in colors) {
      for (final action in actionCards) {
        for (int i = 0; i < actionCardCopies; i++) {
          deck.add(CardModel(color: color, value: action, type: 'action'));
        }
      }
    }

    // Add wild cards (4 of each type)

    for (int i = 0; i < wildCardCopies; i++) {
      deck.add(
        const CardModel(color: 'wild', value: wildCardValue, type: 'action'),
      );
    }

    return deck;
  }

  /// Shuffle the deck
  static void shuffleDeck(List<CardModel> deck) {
    deck.shuffle(Random());
  }
}
