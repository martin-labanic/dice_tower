import "package:dice_tower/dice_tower.dart";

void main(List<String> arguments) async {
  // Defining dice pools.
  Dice d1 = Dice(20);
  Dice d2 = Dice(12, numberOfDice: 2);
  Dice d3 = Dice(10, modifier: -2);
  Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
  Dice d5 = Dice(4, modifier: -10, numberOfDice: 20, title: "Lemons & Limes");

  // Rolling a single dice pool.
  RollResult r1 = Dnd5eRuleset.roll([d1]);

  // Rolling x dice pool.
  RollResult r2 = Dnd5eRuleset.roll([d1, d2, d3, d4, d5]);

  // Pretty printing results.
  print("Title: ${r1.title}\nSum: ${Dnd5eRuleset.prettyPrintSum(r1)}\nRoll Details: ${Dnd5eRuleset.prettyPrintResultDetails(r1)}");
  print("Title: ${r2.title}\nSum: ${Dnd5eRuleset.prettyPrintSum(r2)}\nRoll Details: ${Dnd5eRuleset.prettyPrintResultDetails(r2)}");
}