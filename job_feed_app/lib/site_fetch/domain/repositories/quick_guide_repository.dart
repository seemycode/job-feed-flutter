import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/site_fetch/domain/entities/quick_guide.dart';

abstract class QuickGuideRepository {
  Future<Either<Failure, QuickGuide>> getQuickGuideContent();
}
