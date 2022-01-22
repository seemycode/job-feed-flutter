import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/quick_guide.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/quick_guide_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_quick_guide_content.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_todays_site_fetch_count.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_quick_guide_content_test.mocks.dart';

@GenerateMocks([QuickGuideRepository])
void main() {
  late MockQuickGuideRepository repository;
  late GetQuickGuideContent usecase;

  setUp(() {
    repository = MockQuickGuideRepository();
    usecase = GetQuickGuideContent(repository);
  });

  test(
    "Should get quick guide content in html from repository",
    () async {
      final quickGuide = QuickGuide(htmlContent: 'htmlContent');
      when(repository.getQuickGuideContent())
          .thenAnswer((_) async => Right(quickGuide));

      final result = await usecase(NoParams());

      verify(repository.getQuickGuideContent());
      expect(result, Right(quickGuide));
    },
  );
}
