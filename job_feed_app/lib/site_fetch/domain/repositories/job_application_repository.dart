import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_application.dart';

abstract class JobApplicationRepository {
  Future<Either<Failure, JobApplication>> getTotalOfApplicationsByPeriod(
      String siteUrl);
}
