import 'dice.dart';

/// Result from rolling some dice.
class RollResult {
  /// Roll title.
  final String title;

  /// The dice to roll.
  List<Dice> dicePool = [];

  /// The results of the roll.
  List<List<int>> rolls = [];

  /// Stored so it doesn't need to be added up each time.
  int result = 0;

  /// Constructor.
  RollResult(this.title, this.dicePool);
}
