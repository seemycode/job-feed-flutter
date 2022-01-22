import 'package:equatable/equatable.dart';

class UserPlan extends Equatable {
  final String pseudoUserId;
  final bool isPremium;

  UserPlan({
    required this.pseudoUserId,
    required this.isPremium,
  });

  @override
  String toString() =>
      'UserPlan(pseudoUserId: $pseudoUserId, isPremium: $isPremium)';

  @override
  List<Object> get props => [pseudoUserId, isPremium];
}
