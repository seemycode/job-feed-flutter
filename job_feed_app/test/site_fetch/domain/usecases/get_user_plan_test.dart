import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user_plan.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_user_plan.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_user_plan_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  MockUserRepository repository;
  repository = MockUserRepository();
  final usecase = GetUserPlan(repository);

  test(
    "Should get user plan from the repository",
    () async {
      final userPlan = UserPlan(pseudoUserId: 'pseudoUserId', isPremium: false);
      when(repository.getUserPlan()).thenAnswer((_) async => Right(userPlan));

      final result = await usecase(NoParams());

      verify(repository.getUserPlan());
      expect(result, Right(userPlan));
    },
  );

  //TODO: "Should throw exception when no pseudoUserId is empty" > Data
}
