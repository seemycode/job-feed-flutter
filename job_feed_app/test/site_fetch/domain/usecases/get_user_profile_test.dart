import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_user_profile.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_plan_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  MockUserRepository repository;
  repository = MockUserRepository();
  final usecase = GetUserProfile(repository);

  test(
    "Should pass pseudo user id and user plan to get user profile from the repository",
    () async {
      final user =
          User(pseudoUserId: 'pseudoUserId', userProfileUrl: 'userProfileUrl');
      when(repository.getUserProfile()).thenAnswer((_) async => Right(user));

      final result = await usecase(NoParams());

      verify(repository.getUserProfile());
      expect(result, Right(user));
    },
  );
}
