import 'package:equatable/equatable.dart';

abstract class Success extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResponseStatus extends Success {
  final String message;

  ResponseStatus({required this.message});
}
