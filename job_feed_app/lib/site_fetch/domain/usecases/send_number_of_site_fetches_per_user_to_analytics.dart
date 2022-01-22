import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/analytics_repository.dart';

class SendNumberOfSiteFetchesPerUserToAnalytics
    extends UseCase<Success, Analytics> {
  final AnalyticsRepository repository;
  SendNumberOfSiteFetchesPerUserToAnalytics(this.repository);

  @override
  Future<Either<Failure, Success>> call(Analytics params) {
    // check analytics type and source attribute
    if (params.eventName != 'site_fetches_per_user') {
      return Future.value(Left(AnalyticsIncorrectEventType()));
    }

    return repository.sendNumberOfSiteFetchesPerUserToAnalytics(
        analytics: params);
  }
}
