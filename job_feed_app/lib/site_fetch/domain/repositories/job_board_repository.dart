import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_board.dart';

abstract class JobBoardRepository {
  Future<Either<Failure, List<JobBoard>>> getJobBoardsOfAUser();
  Future<Either<Failure, JobBoard>> addSiteToFetch();
}
