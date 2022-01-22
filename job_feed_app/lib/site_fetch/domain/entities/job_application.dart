import 'package:equatable/equatable.dart';

class JobApplication extends Equatable {
  final int applicationsTotal;
  JobApplication({
    required this.applicationsTotal,
  });

  @override
  String toString() => 'JobApplication(applicationsTotal: $applicationsTotal)';

  @override
  List<Object> get props => [applicationsTotal];
}
