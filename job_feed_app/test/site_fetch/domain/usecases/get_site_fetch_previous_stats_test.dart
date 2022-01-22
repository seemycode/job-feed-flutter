import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_site_fetch_previous_stats.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_site_fetch_last_stats_test.mocks.dart';

@GenerateMocks([SiteFetchRepository])
void main() {
  final repository = MockSiteFetchRepository();
  final usecase = GetSiteFetchPreviousStats(repository);

  final siteFetch = SiteFetch(
      previousTotalMatches: 10,
      currentTotalMatches: 0,
      availableSiteFetches: 0,
      remainingSiteFetches: 0);
  test(
    "Should return previous stats from repository",
    () async {
      when(repository.getSiteFetchPreviousStats(siteUrl: 'siteUrl'))
          .thenAnswer((_) async => Right(siteFetch));

      final result =
          await usecase(GetSiteFetchPreviousStatsParams(siteUrl: 'siteUrl'));

      verify(repository.getSiteFetchPreviousStats(siteUrl: 'siteUrl'));
      expect(result, Right(siteFetch));
    },
  );
}
