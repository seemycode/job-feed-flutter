import 'package:job_feed_app/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/quick_guide.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/quick_guide_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_todays_site_fetch_count.dart';

class GetQuickGuideContent extends UseCase<QuickGuide, NoParams> {
  final QuickGuideRepository repository;
  GetQuickGuideContent(this.repository);

  @override
  Future<Either<Failure, QuickGuide>> call(NoParams params) {
    return repository.getQuickGuideContent();
  }
}
