import 'package:job_feed_app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart';

class GetTodaysSiteFetchCount extends UseCase<SiteFetch, NoParams> {
  final SiteFetchRepository repository;
  GetTodaysSiteFetchCount(this.repository);

  @override
  Future<Either<Failure, SiteFetch>> call(NoParams params) {
    return repository.getTodaysSiteFetchCount();
  }
}

class NoParams {}
