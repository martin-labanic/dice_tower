import "dart:math";
import "dice.dart";
import "roll_result.dart";
import "ruleset.dart";

/// Ruleset for Dungeons & Dragons 5th Edition.
class Dnd5eRuleset implements Ruleset {
  /// Rolls the provided dice.
  static RollResult roll(List<Dice> dice, {String title = ""}) {
    RollResult result;
    if (dice.isNotEmpty) {
      /// Generate the title if one was not provided.
      if (title.isEmpty) {
        dice.forEach((di) => title += " + " + di.title);
        title = title.substring(3);
      }

      /// Roll each di the right number of times.
      result = RollResult(title, dice);
      Random random = Random();
      int sum = 0;
      for (int i = 0; i<dice.length; i++) {
        Dice di = dice[i];
        List<int> diceRolls = [];//List(di.numberOfDice);
        for (int j = 0; j < di.numberOfDice; j++) {
          int toss = random.nextInt(di.sides)+1;
          sum += toss;
          diceRolls.add(toss); // Max exclusive, 0 inclusive.
        }
        sum += di.modifier;
        result.rolls.add(diceRolls);
      }
      result.sum = sum;
    } else {
      result = RollResult("Invalid.", []);
    }
    return result;
  }

  /// Pretty prints the sum of the roll result.
  static String prettyPrintSum(RollResult roll) {
    String result = "";
    if (roll.rolls.isNotEmpty) {
      if (roll.rolls.length == 1) {
        if (roll.dicePool[0].sides == 20 && roll.dicePool[0].numberOfDice == 1 && roll.sum == 1) {
          result = "natural 1";
        } else if (roll.dicePool[0].sides == 20 && roll.dicePool[0].numberOfDice == 1 && roll.sum == 20) {
          result = "natural 20";
        } else {
          result = roll.sum.toString();
        }
      } else {
        result = roll.sum.toString();
      }
    }
    return result;
  }

  /// Pretty prints the a breakdown of the roll results.
  /// ex:
  static String prettyPrintResultDetails(RollResult roll) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write("");
    for (int i = 0; i < roll.rolls.length; i++) {
      Dice di = roll.dicePool[i];
      roll.rolls[i].forEach((roll) {
        stringBuffer.write("+$roll");
      });
      if (di.modifier != 0) {
        stringBuffer.write(di.modifier > 0 ? "+${di.modifier}" : "${di.modifier}");
      }
    }
    return stringBuffer.toString();
  }
}