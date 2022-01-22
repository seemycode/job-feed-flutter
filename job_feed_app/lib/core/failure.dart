import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class DeviceStorageFailure extends Failure {}

class DataFailure extends Failure {}

class AnalyticsIncorrectPremiumSource extends Failure {}

class AnalyticsIncorrectEventType extends Failure {}
