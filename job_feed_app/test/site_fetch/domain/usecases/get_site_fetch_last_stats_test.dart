import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_site_fetch_last_stats.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_site_fetch_last_stats_test.mocks.dart';

@GenerateMocks([SiteFetchRepository])
void main() {
  MockSiteFetchRepository repository;
  repository = MockSiteFetchRepository();
  final usecase = GetSiteFetchLastStats(repository);

  final siteFetch = SiteFetch(
      previousTotalMatches: 0,
      currentTotalMatches: 10,
      availableSiteFetches: 0,
      remainingSiteFetches: 0);
  test(
    "Shoud return last site fetch status from repository",
    () async {
      when(repository.getSiteFetchLastStats(siteUrl: 'siteUrl'))
          .thenAnswer((_) async => Right(siteFetch));

      final result = await usecase(Params(siteUrl: 'siteUrl'));

      verify(repository.getSiteFetchLastStats(siteUrl: 'siteUrl'));
      expect(result, Right(siteFetch));
    },
  );
}
