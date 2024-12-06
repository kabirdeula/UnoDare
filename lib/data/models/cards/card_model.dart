import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String color, // red, blue, green, yellow, or wild
    required String value, // 0-9, reverse, skip, etc.
    required String type, // number or action
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}

extension CardModelDescription on CardModel {
  String describe() {
    return "Card: $color $value ($type)";
  }
}
