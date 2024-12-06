import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uno_dare/data/models/cards/card_model.dart';

part 'player.freezed.dart';
part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String name,
    required List<CardModel> hand,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
