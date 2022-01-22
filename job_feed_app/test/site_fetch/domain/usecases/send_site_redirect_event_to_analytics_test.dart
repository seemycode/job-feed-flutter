import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/success.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/analytics_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/send_site_redirect_event_to_analytics.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_site_redirect_event_to_analytics_test.mocks.dart';

@GenerateMocks([AnalyticsRepository])
void main() {
  late MockAnalyticsRepository repository;
  late SendRedirectEventToAnalytics usecase;

  setUp(() {
    repository = MockAnalyticsRepository();
    usecase = SendRedirectEventToAnalytics(repository);
  });

  test(
    "Should return AnalyticsIncorrectEventType when sending analytics of type else than 'redirect_to_site'",
    () async {
      final analytics = Analytics.upgradeIntention(
          siteUrl: 'siteUrl', source: 'in_card_action');
      final failure = AnalyticsIncorrectEventType();

      when(repository.sendSiteRedirectEventToAnalytics(analytics: analytics))
          .thenAnswer((_) async => Left(failure));

      final result = await usecase(analytics);

      verifyNever(
          repository.sendSiteRedirectEventToAnalytics(analytics: analytics));
      expect(result, Left(failure));
    },
  );

  test(
    "Should send 'redirect_to_site' analytics to repository",
    () async {
      final analytics = Analytics.siteRedirect(siteUrl: 'siteUrl');
      final status = ResponseStatus(message: 'message');

      when(repository.sendSiteRedirectEventToAnalytics(analytics: analytics))
          .thenAnswer((_) async => Right(status));

      final result = await usecase(analytics);

      verify(repository.sendSiteRedirectEventToAnalytics(analytics: analytics));
      expect(result, Right(status));
    },
  );
}
