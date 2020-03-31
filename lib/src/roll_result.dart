import 'dice.dart';

enum SortOrder {
  Ascending,
  Descending
}

/// Result from rolling some dice.
class RollResult {
  /// Roll title.
  final String title;

  /// The dice to roll.
  List<Dice> dicePool = [];

  /// The results of the roll.
  List<List<int>> rolls = [];

  /// Stored so it doesn't need to be calculated each time.
  int result = 0;

  /// Constructor.
  RollResult(this.title, this.dicePool);

  /// Sorts the roll result.
  bool sortRolls(SortOrder sortOrder) {
    bool sorted = false;
    if (sortOrder == null) {
      return sorted;
    }

    if (sortOrder == SortOrder.Ascending) {
      for (List<int> r in rolls) {
        r.sort(); // Default is ascending.
      }
      sorted = true;
    } else if (sortOrder == SortOrder.Descending) {
      for (List<int> r in rolls) {
        r.sort((a, b) => b.compareTo(a));
      }
      sorted = true;
    }

    return sorted;
  }
}
