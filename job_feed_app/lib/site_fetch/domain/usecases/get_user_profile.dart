import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/user.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';

class GetUserProfile extends UseCase<User, NoParams> {
  final UserRepository repository;

  GetUserProfile(this.repository);

  @override
  Future<Either<Failure, User>> call(params) {
    return repository.getUserProfile();
  }
}
