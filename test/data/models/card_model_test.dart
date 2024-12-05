import 'package:flutter_test/flutter_test.dart';
import 'package:uno_dare/data/models/card_model.dart';

void main() {
  group('Card Model', () {
    test('should create a valid number card', () {
      const card = CardModel(color: 'red', value: '5', type: 'number');
      expect(card.color, 'red');
      expect(card.value, '5');
      expect(card.type, 'number');
    });

    test('should create a valid action card', () {
      const card = CardModel(color: 'blue', value: 'skip', type: 'action');
      expect(card.color, 'blue');
      expect(card.value, 'skip');
      expect(card.type, 'action');
    });

    test('should describe the card correctly', () {
      const card = CardModel(color: 'green', value: 'reverse', type: 'action');
      expect(card.describe(), 'Card: green reverse (action)');
    });
  });
}
