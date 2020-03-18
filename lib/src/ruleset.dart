import 'roll_result.dart';

/// All of the rulesets should have these basic functions definded.
// ignore: avoid_classes_with_only_static_members
abstract class Ruleset {
  /// Rolling the dice,
  static RollResult roll;

  /// Pretty prints the sum.
  static String prettyPrintResult;

  /// Pretty prints the roll details.
  static String prettyPrintResultDetails
  ;
}
