import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user_plan.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';

class GetUserPlan extends UseCase<UserPlan, NoParams> {
  final UserRepository repository;

  GetUserPlan(this.repository);

  @override
  Future<Either<Failure, UserPlan>> call(params) {
    return repository.getUserPlan();
  }
}
