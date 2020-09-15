import "package:flutter_test/flutter_test.dart";

import "package:dice_tower/dice_tower.dart";

void main() {
  test("title generation", () {
    Dice d1 = Dice(20);
    assert(d1.generateTitle() == "D20");
    Dice d2 = Dice(12, numberOfDice: 2);
    assert(d2.generateTitle() == "2xD12");
    Dice d3 = Dice(10, modifier: -2);
    assert(d3.generateTitle() == "D10-2");
    Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
    assert(d4.generateTitle() == "3xD8+1");
    Dice d5 = Dice(4, modifier: -10, numberOfDice: 20, title: "Lemons & Limes");
    assert(d5.title == "Lemons & Limes");
    RollResult r = Dnd5eRuleset.roll([d2, d1, d5, d4, d3]);
    assert(r.title == "2xD12 + D20 + Lemons & Limes + 3xD8+1 + D10-2");
  });

  test("constructor", () {
    Dice d = Dice(20);
    RollResult r = Dnd5eRuleset.roll([d]);
    assert(r.title == "D20" && r.result >= 1 && r.result <= 20);
  });

  test("customized constructor", () {
    Dice d = Dice(20, modifier: 3, numberOfDice: 5, title: "Hmmmm");
    assert(d.title == "Hmmmm");
    assert(d.numberOfDice == 5);
    assert(d.sides == 20);
    assert(d.modifier == 3);
  });

  test("dnd single di", () {
    Dice d1 = Dice(20);
    Dice d2 = Dice(100, modifier: -23, numberOfDice: 2);

    RollResult r;
    for (int i = 0; i < 11111; i++) {
      r = Dnd5eRuleset.roll([d1]);
      print("${Dnd5eRuleset.prettyPrintResult(r)} | ${Dnd5eRuleset.prettyPrintResultDetails(r)}");
      assert(r.result >= 1 && r.result <= 20);
    }
    for (int j = 0; j < 11111; j++) {
      r = Dnd5eRuleset.roll([d2]);
      assert(r.result >= 0 && r.result <= 177);
    }
  });

  test("dnd large dice pool", () {
    Dice d1 = Dice(20);
    Dice d2 = Dice(12, numberOfDice: 2);
    Dice d3 = Dice(10, modifier: -2);
    Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
    Dice d5 = Dice(6, numberOfDice: 6);
    Dice d6 = Dice(4);
//    Dice d1 = Dice(20);
//    Dice d2 = Dice(12, numberOfDice: 2);
//    Dice d3 = Dice(10,);
//    Dice d4 = Dice(8, numberOfDice: 3);
//    Dice d5 = Dice(6, numberOfDice: 6);
//    Dice d6 = Dice(4);

    RollResult r;
    for (int i = 0; i < 11111; i++) {
      r = Dnd5eRuleset.roll([d1, d6], sortOrder: SortOrder.Ascending);
      print("ASC ${Dnd5eRuleset.prettyPrintResult(r)} | ${Dnd5eRuleset.prettyPrintResultDetails(r)}");
      assert(r.result >= 2 && r.result <= 24);
    }
    for (int j = 0; j < 11111; j++) {
      r = Dnd5eRuleset.roll([d2, d5]);
      assert(r.result >= 8 && r.result <= 60);
    }
    for (int k = 0; k < 11111; k++) {
      r = Dnd5eRuleset.roll([d3, d4], sortOrder: SortOrder.Descending);
      print("DESC ${Dnd5eRuleset.prettyPrintResult(r)} | ${Dnd5eRuleset.prettyPrintResultDetails(r)}");
      assert(r.result >= 3 && r.result <= 33);
    }
    for (int k = 0; k < 11111; k++) {
      r = Dnd5eRuleset.roll([d3, d4], sortOrder: SortOrder.Ascending);
      print("ASC2 ${Dnd5eRuleset.prettyPrintResult(r)} | ${Dnd5eRuleset.prettyPrintResultDetails(r)}");
      assert(r.result >= 3 && r.result <= 33);
    }
  });
}
