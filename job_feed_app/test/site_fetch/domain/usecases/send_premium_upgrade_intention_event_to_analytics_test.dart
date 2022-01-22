import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/analytics_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../lib/site_fetch/domain/usecases/send_premium_upgrade_intention_event_to_analytics.dart';
import 'send_premium_upgrade_intention_event_to_analytics_test.mocks.dart';

@GenerateMocks([AnalyticsRepository])
void main() {
  late MockAnalyticsRepository repository;
  late SendPremiumIntentionEventToAnaytics usecase;

  setUp(() {
    repository = MockAnalyticsRepository();
    usecase = SendPremiumIntentionEventToAnaytics(repository);
  });

  test(
    "Should return AnalyticsIncorrectEventType when sending analytics of type else than 'upgrade_intention'",
    () async {
      final analytics = Analytics.siteRedirect(siteUrl: 'siteUrl');
      final failure = AnalyticsIncorrectEventType();

      when(repository.sendPremiumUpgradeIntentionEventToAnalytics(
              analytics: analytics))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(analytics);

      verifyNever(repository.sendPremiumUpgradeIntentionEventToAnalytics(
          analytics: analytics));
      expect(result, Left(failure));
    },
  );

  test(
    "Should accept only in_card_action and own_card_action as source, throwing AnalyticsIncorrectPremiumSource otherwise",
    () async {
      final analytics =
          Analytics.upgradeIntention(siteUrl: 'siteUrl', source: 'sth_odd');
      final failure = AnalyticsIncorrectPremiumSource();

      when(repository.sendPremiumUpgradeIntentionEventToAnalytics(
              analytics: analytics))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(analytics);

      verifyNever(repository.sendPremiumUpgradeIntentionEventToAnalytics(
          analytics: analytics));
      expect(result, Left(failure));
    },
  );
  test(
    "Should send 'upgrade_intention' analytics to repository",
    () async {
      final analytics = Analytics.upgradeIntention(
          siteUrl: 'siteUrl', source: 'in_card_action');
      final status = ResponseStatus(message: 'message');

      when(repository.sendPremiumUpgradeIntentionEventToAnalytics(
              analytics: analytics))
          .thenAnswer((_) async => Right(status));

      final result = await usecase(analytics);

      verify(repository.sendPremiumUpgradeIntentionEventToAnalytics(
          analytics: analytics));
      expect(result, Right(status));
    },
  );
}
