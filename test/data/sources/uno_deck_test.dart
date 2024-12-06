import 'package:flutter_test/flutter_test.dart';
import 'package:uno_dare/data/sources/uno_deck.dart';

void main() {
  group('Uno Deck', () {
    test('should generate a deck with 108 cards', () {
      final deck = UnoDeck.generateDeck();
      expect(deck.length, 108);
    });

    test('should generate number cards amount to 76', () {
      // Number cards: 76 (4 colors x 19 cards per color)
      final deck = UnoDeck.generateDeck();
      final cards = deck.where((card) => card.type == 'number').toList();
      expect(cards.length, 76);
    });

    test('should validate cards by color', () {
      final deck = UnoDeck.generateDeck();
      final numberCards = deck.where((card) => card.type == 'number').toList();

      for (final color in UnoDeck.colors) {
        // 1 zero + (1-9) twice
        final colorNumberCards =
            numberCards.where((card) => card.color == color).toList();
        expect(colorNumberCards.length, 19);
        // 1 zero
        final zeroNumberCards =
            colorNumberCards.where((card) => card.value == '0').toList();
        expect(zeroNumberCards.length, 1);

        for (int i = 1; i <= 9; i++) {
          final valueCards =
              colorNumberCards.where((card) => card.value == '$i').toList();
          expect(valueCards.length, 2);
        }
      }
    });

    test('should generate action cards', () {
      final deck = UnoDeck.generateDeck();

      final cards = deck
          .where((card) =>
              card.type == 'action' && UnoDeck.colors.contains(card.color))
          .toList();
      expect(cards.length, 24);
    });

    test('should generate wild cards', () {
      final deck = UnoDeck.generateDeck();

      final cards = deck.where((card) => card.color == 'wild').toList();
      expect(cards.length, 8);
    });
  });
}
