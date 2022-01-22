import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user_plan.dart';

abstract class UserRepository {
  Future<Either<Failure, UserPlan>> getUserPlan();
  Future<Either<Failure, User>> getUserProfile();
}
