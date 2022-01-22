import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String pseudoUserId;
  final String userProfileUrl;
  User({
    required this.pseudoUserId,
    required this.userProfileUrl,
  });
  @override
  String toString() =>
      'User(pseudoUserId: $pseudoUserId, userProfileUrl: $userProfileUrl)';

  @override
  List<Object> get props => [pseudoUserId, userProfileUrl];
}
