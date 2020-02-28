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
      Random random = Random.secure();
      int sum = 0;
      for (int i = 0; i < dice.length; i++) {
        Dice di = dice[i];
        List<int> diceRolls = []; //List(di.numberOfDice);
        for (int j = 0; j < di.numberOfDice; j++) {
          int toss = random.nextInt(di.sides) + 1;
          sum += toss;
          diceRolls.add(toss); // Max exclusive, 0 inclusive.
        }
        sum += di.modifier;
        result.rolls.add(diceRolls);
      }
      result.sum = sum >= 0
          ? sum
          : 0; // Minimum is 0 in 5e. https://www.sageadvice.eu/2014/11/14/unarmed-damage/
    } else {
      result = RollResult("Invalid.", []);
    }

    return result;
  }

  /// Pretty prints the sum of the roll result.
  static String prettyPrintSum(RollResult roll) {
    String result = "";
    if (roll == null ||
        roll.dicePool == null ||
        roll.rolls.isEmpty ||
        roll.dicePool.isEmpty) {
      return result;
    }

    if (roll.dicePool.length == 1 &&
        roll.dicePool[0].numberOfDice == 1 &&
        roll.dicePool[0].sides == 20) {
      if (roll.rolls[0][0] == 1) {
        result = "natural 1";
      } else if (roll.rolls[0][0] == 20) {
        result = "natural 20";
      } else {
        result = roll.sum.toString();
      }
    } else {
      result = roll.sum.toString();
    }

    return result;
  }

  /// Pretty prints the a breakdown of the roll results.
  /// ex:
  static String prettyPrintResultDetails(RollResult roll) {
    String result = "";
    if (roll == null || roll.rolls == null || roll.rolls.isEmpty) {
      return result;
    }

    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write("");
    for (int i = 0; i < roll.rolls.length; i++) {
      Dice di = roll.dicePool[i];
      roll.rolls[i].forEach((roll) {
        stringBuffer.write("+$roll");
      });
      if (di.modifier != 0) {
        stringBuffer
            .write(di.modifier > 0 ? "+${di.modifier}" : "${di.modifier}");
      }
    }
    result = stringBuffer.toString().substring(1);

    return result;
  }
}
