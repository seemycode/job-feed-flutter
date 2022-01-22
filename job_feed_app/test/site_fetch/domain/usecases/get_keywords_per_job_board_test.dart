import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/keyword.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/get_keywords_per_job_board.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/keyword_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_keywords_per_job_board_test.mocks.dart';

@GenerateMocks([KeywordRepository])
void main() {
  late MockKeywordRepository repository;
  late GetKeywordsPerJobBoard usecase;

  setUp(() {
    repository = MockKeywordRepository();
    usecase = GetKeywordsPerJobBoard(repository);
  });

  final keywords = [
    Keyword(siteUrl: 'siteUrl', label: 'label', relevancy: 0),
  ];

  test(
    "Should pass siteUrl and get list of keywords of a job site from repository",
    () async {
      when(repository.getKeywordsPerJobBoard(siteUrl: 'siteUrl'))
          .thenAnswer((_) async => Right(keywords));

      final result =
          await usecase(GetKeywordsPerJobBoardParams(siteUrl: 'siteUrl'));

      verify(repository.getKeywordsPerJobBoard(siteUrl: 'siteUrl'));
      expect(result, Right(keywords));
    },
  );
}
