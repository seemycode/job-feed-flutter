import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/analytics_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/send_number_of_site_fetches_per_user_to_analytics.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_number_of_site_fetches_per_user_to_analytics_test.mocks.dart';

@GenerateMocks([AnalyticsRepository])
void main() {
  late MockAnalyticsRepository repository;
  late SendNumberOfSiteFetchesPerUserToAnalytics usecase;

  setUp(() {
    repository = MockAnalyticsRepository();
    usecase = SendNumberOfSiteFetchesPerUserToAnalytics(repository);
  });

  test(
    "Should return AnalyticsIncorrectEventType when sending analytics of type else than 'site_fetches_per_user'",
    () async {
      final analytics = Analytics.upgradeIntention(
          siteUrl: 'siteUrl', source: 'in_card_action');
      final failure = AnalyticsIncorrectEventType();

      when(repository.sendNumberOfSiteFetchesPerUserToAnalytics(
              analytics: analytics))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(analytics);

      verifyNever(repository.sendNumberOfSiteFetchesPerUserToAnalytics(
          analytics: analytics));
      expect(result, Left(failure));
    },
  );

  test(
    "Should send 'site_fetches_per_user' analytics to repository",
    () async {
      final analytics =
          Analytics.numberOfSiteFetches(site_fetch_attempt_result: true);
      final status = ResponseStatus(message: 'message');

      when(repository.sendNumberOfSiteFetchesPerUserToAnalytics(
              analytics: analytics))
          .thenAnswer((_) async => Right(status));

      final result = await usecase(analytics);

      verify(repository.sendNumberOfSiteFetchesPerUserToAnalytics(
          analytics: analytics));
      // expect(result, Right(status));
    },
  );
}
