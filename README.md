# dice_tower

A flutter package for rolling dice.

Currently implemented rule sets:
- Dungeons & Dragons 5e

Planned rule sets:
- Shadowrun 5e

Examples:
```dart
// Constructors
Dice d1 = Dice(20);
Dice d2 = Dice(12, numberOfDice: 2);
Dice d3 = Dice(10, modifier: -2);
Dice d4 = Dice(8, modifier: 1, numberOfDice: 3);
Dice d5 = Dice(4, modifier: -10, numberOfDice: 20, title: "Lemons & Limes");

// Rolling
RollResult r1 = Dnd5eRuleset.roll([d1]);
RollResult r2 = Dnd5eRuleset.roll([d1, d2, d3, d4, d5]);
```