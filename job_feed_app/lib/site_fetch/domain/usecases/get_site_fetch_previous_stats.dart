import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart';

class GetSiteFetchPreviousStats
    extends UseCase<SiteFetch, GetSiteFetchPreviousStatsParams> {
  SiteFetchRepository repository;
  GetSiteFetchPreviousStats(this.repository);

  @override
  Future<Either<Failure, SiteFetch>> call(
      GetSiteFetchPreviousStatsParams params) {
    return repository.getSiteFetchPreviousStats(siteUrl: params.siteUrl);
  }
}

class GetSiteFetchPreviousStatsParams {
  final String siteUrl;
  GetSiteFetchPreviousStatsParams({
    required this.siteUrl,
  });
}
