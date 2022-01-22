import 'package:equatable/equatable.dart';

class SiteFetch extends Equatable {
  final int previousTotalMatches;
  final int currentTotalMatches;
  final int availableSiteFetches;
  final int remainingSiteFetches;
  SiteFetch({
    required this.previousTotalMatches,
    required this.currentTotalMatches,
    required this.availableSiteFetches,
    required this.remainingSiteFetches,
  });

  @override
  String toString() {
    return 'SiteFetch(previousTotalMatches: $previousTotalMatches, currentTotalMatches: $currentTotalMatches, availableSiteFetches: $availableSiteFetches, remainingSiteFetches: $remainingSiteFetches)';
  }

  @override
  List<Object> get props => [
        previousTotalMatches,
        currentTotalMatches,
        availableSiteFetches,
        remainingSiteFetches
      ];
}
