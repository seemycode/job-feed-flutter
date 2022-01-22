import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';
import '../../../core/usecase.dart';
import '../entities/site_fetch.dart';
import '../repositories/site_fetch_repository.dart';

class GetSiteFetchLastStats extends UseCase<SiteFetch, Params> {
  final SiteFetchRepository repository;
  GetSiteFetchLastStats(this.repository);

  @override
  Future<Either<Failure, SiteFetch>> call(Params params) {
    return repository.getSiteFetchLastStats(siteUrl: params.siteUrl);
  }
}

class Params {
  final String siteUrl;
  Params({
    required this.siteUrl,
  });
}
