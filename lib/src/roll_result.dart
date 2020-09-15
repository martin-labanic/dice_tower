import "dice.dart";

enum SortOrder { None, Ascending, Descending }

/// Result from rolling some dice.
class RollResult {
  /// Roll title.
  final String title;

  /// The dice to roll.
  List<Dice> dicePool = [];

  /// The results of the roll.
  List<int> rolls = [];

  /// Stored so it doesn't need to be calculated each time.
  int result = 0;

  /// Constructor.
  RollResult(this.title, this.dicePool);

  /// Sorts the roll result.
  /// [sortOrder] Sort order to apply to the roll result.
  bool sortRolls(SortOrder sortOrder) {
    bool sorted = false;
    if (sortOrder == null || sortOrder == SortOrder.None) {
      return sorted;
    }

    if (sortOrder == SortOrder.Ascending) {
      rolls.sort();
      sorted = true;
    } else if (sortOrder == SortOrder.Descending) {
      rolls.sort((a, b) => b.compareTo(a));
      sorted = true;
    }

    return sorted;
  }
}
//23-26b