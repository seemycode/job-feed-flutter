import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/analytics_repository.dart';

class SendPremiumIntentionEventToAnaytics extends UseCase<Success, Analytics> {
  final AnalyticsRepository repository;
  SendPremiumIntentionEventToAnaytics(this.repository);

  @override
  Future<Either<Failure, Success>> call(Analytics params) {
    // check analytics type and source attribute
    if (params.eventName != 'upgrade_intention') {
      return Future.value(Left(AnalyticsIncorrectEventType()));
    } else if (!params.toMap().containsKey('source') ||
        !['in_card_action', 'own_card_action']
            .contains(params.toMap()['source'])) {
      return Future.value(Left(AnalyticsIncorrectPremiumSource()));
    }

    return repository.sendPremiumUpgradeIntentionEventToAnalytics(
        analytics: params);
  }
}
