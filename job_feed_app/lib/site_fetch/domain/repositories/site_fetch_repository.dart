import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';

abstract class SiteFetchRepository {
  Future<Either<Failure, SiteFetch>> getSiteFetchLastStats(
      {required String siteUrl});
  Future<Either<Failure, SiteFetch>> getSiteFetchPreviousStats(
      {required String siteUrl});
  Future<Either<Failure, SiteFetch>> getTodaysSiteFetchCount();
}
