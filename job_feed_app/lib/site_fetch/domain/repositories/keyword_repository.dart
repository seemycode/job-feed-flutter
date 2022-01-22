import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/keyword.dart';

abstract class KeywordRepository extends Equatable {
  Future<Either<Failure, List<Keyword>>> getKeywordsPerJobBoard(
      {required String siteUrl});
}
