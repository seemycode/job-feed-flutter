import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';

abstract class AnalyticsRepository {
  Future<Either<Failure, Success>> sendPremiumUpgradeIntentionEventToAnalytics(
      {required Analytics analytics});
  Future<Either<Failure, Success>> sendSiteRedirectEventToAnalytics(
      {required Analytics analytics});
  Future<Either<Failure, Success>> sendNumberOfSiteFetchesPerUserToAnalytics(
      {required Analytics analytics});
  Future<Either<Failure, Success>> sendPremiumMaybeLaterEventToAnalytics(
      {required Analytics analytics});
}
