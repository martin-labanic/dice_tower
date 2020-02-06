///
class Dice {
  /// The number of sides on these dice.
  int sides;

  /// The roll modifier.
  int modifier;

  /// The number of dice
  int numberOfDice;

  /// The title of the roll.
  String title;

  ///
  Dice(this.sides,
      {this.modifier = 0, this.numberOfDice = 1, String title = ""}) {
    this.title = title.isNotEmpty ? title : generateTitle();
  }

  /// Generates the title of the roll based on the  dice values.
  /// ex:
  String generateTitle() {
    String modifierString = modifier != 0
        ? (modifier > 0 ? "+" + modifier.toString() : modifier.toString())
        : "";
    return (numberOfDice > 1
        ? "${numberOfDice}xD$sides$modifierString"
        : "D$sides$modifierString");
  }
}
