## [0.6.5] - 20/04/16
- Added `None` sort order as a sort option.
- Added the `useSecureRandom` parameter to the `roll` function.
- Improved comments.

## [0.6.0] - 2020/03/30
- Added sorting options.
    - Limitation: Currently this only works correctly if you're not using more than one type of di.
- Breaking change:
    - Refactored function names: `prettyPrintSum` -> `prettyPrintResult`, `prettyPrintSumBreakdown` -> `prettyPrintResultDetails`.

## [0.5.3+1] - 2020/02/28
- Updated pubspec description.
- Minor formatting.

## [0.5.3] - 2020/02/27
- Improved description.

- D&D 5e ruleset:
    - Switched to using the cryptographically secure random number generator for improved randomness.
    - Additional safety checks in the pretty print functions.

## [0.5.2] - 2020/02/05
- D&D 5e ruleset:
    - Fixed bug where it was not using the special strings for natural 1s / 20s.
    - Fixed Pretty prints sum formatting.

## [0.5.1] - 2020/02/04
- D&D 5e ruleset:
    - Fixed negative roll numbers. Unless I've missed something in the rule book, rolls cannot go below 0.

## [0.5.0] - 2020/01/26
- Initial release with Dungeons & Dragons 5e support.