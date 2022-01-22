import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_application.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/job_application_repository.dart';

class GetTotalOfApplicationsByPeriod
    extends UseCase<JobApplication, GetTotalOfApplicationsByPeriodParams> {
  JobApplicationRepository repository;
  GetTotalOfApplicationsByPeriod(this.repository);

  @override
  Future<Either<Failure, JobApplication>> call(
      GetTotalOfApplicationsByPeriodParams params) {
    return repository.getTotalOfApplicationsByPeriod(params.siteUrl);
  }
}

class GetTotalOfApplicationsByPeriodParams {
  final String siteUrl;
  GetTotalOfApplicationsByPeriodParams({
    required this.siteUrl,
  });
}
