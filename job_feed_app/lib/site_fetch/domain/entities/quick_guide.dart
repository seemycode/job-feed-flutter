import 'package:equatable/equatable.dart';

class QuickGuide extends Equatable {
  final String htmlContent;
  QuickGuide({
    required this.htmlContent,
  });

  @override
  String toString() => 'QuickGuide(content: $htmlContent)';

  @override
  List<Object> get props => [htmlContent];
}
