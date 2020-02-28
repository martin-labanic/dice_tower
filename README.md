# dice_tower

A flutter package for rolling dice using the rules for various table top games.

## Supported rulesets:
- Dungeons & Dragons 5e

## Planned rulesets:
- Shadowrun 5e
- Pathfinder

## Installation

To use this plugin, add `dice_tower` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Usage

Import the library.
```dart
import "package:dice_tower/dice_tower.dart";
```

Create some dice.
```dart
Dice d1 = Dice(20);
Dice d2 = Dice(8, modifier: 1, numberOfDice: 3);
```

Roll them using a ruleset.
```dart
RollResult r1 = Dnd5eRuleset.roll([d1]); // Single di.
RollResult r2 = Dnd5eRuleset.roll([d1, d2]); // Multiple dice at once.
```