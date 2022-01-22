import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_todays_site_fetch_count.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_todays_site_fetch_count_test.mocks.dart';

@GenerateMocks([SiteFetchRepository])
void main() {
  late MockSiteFetchRepository repository;
  late GetTodaysSiteFetchCount usecase;

  setUp(() {
    repository = MockSiteFetchRepository();
    usecase = GetTodaysSiteFetchCount(repository);
  });

  test(
    "Should return both total of available vs remaining site fetches from the repository",
    () async {
      final siteFetch = SiteFetch(
          previousTotalMatches: 1,
          currentTotalMatches: 1,
          availableSiteFetches: 1,
          remainingSiteFetches: 1);
      when(repository.getTodaysSiteFetchCount())
          .thenAnswer((_) async => Right(siteFetch));

      final result = await usecase(NoParams());

      verify(repository.getTodaysSiteFetchCount());
      expect(result, Right(siteFetch));
    },
  );
}
