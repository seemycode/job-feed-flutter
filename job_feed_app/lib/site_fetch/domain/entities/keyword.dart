import 'package:equatable/equatable.dart';

class Keyword extends Equatable {
  final String siteUrl;
  final String label;
  final double relevancy;
  Keyword({
    required this.siteUrl,
    required this.label,
    required this.relevancy,
  });

  @override
  String toString() =>
      'Keyword(siteUrl: $siteUrl, label: $label, relevancy: $relevancy)';

  @override
  List<Object> get props => [siteUrl, label, relevancy];
}
