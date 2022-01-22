import 'package:job_feed_app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/keyword.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/keyword_repository.dart';

class GetKeywordsPerJobBoard
    extends UseCase<List<Keyword>, GetKeywordsPerJobBoardParams> {
  final KeywordRepository repository;
  GetKeywordsPerJobBoard(this.repository);

  @override
  Future<Either<Failure, List<Keyword>>> call(
      GetKeywordsPerJobBoardParams params) {
    return repository.getKeywordsPerJobBoard(siteUrl: params.siteUrl);
  }
}

class GetKeywordsPerJobBoardParams {
  final String siteUrl;
  GetKeywordsPerJobBoardParams({
    required this.siteUrl,
  });
}
