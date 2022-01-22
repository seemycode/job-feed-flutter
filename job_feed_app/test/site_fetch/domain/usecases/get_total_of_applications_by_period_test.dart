import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_application.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/job_application_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_total_of_applications_by_period.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_total_of_applications_by_period_test.mocks.dart';

@GenerateMocks([JobApplicationRepository])
void main() {
  late MockJobApplicationRepository repository;
  late GetTotalOfApplicationsByPeriod usecase;

  setUp(() {
    repository = MockJobApplicationRepository();
    usecase = GetTotalOfApplicationsByPeriod(repository);
  });

  test(
    "Should pass in siteUrl and return the total of applications from repository",
    () async {
      final jobApplication = JobApplication(applicationsTotal: 0);
      when(repository.getTotalOfApplicationsByPeriod('siteUrl'))
          .thenAnswer((_) async => Right(jobApplication));

      final result = await usecase(
          GetTotalOfApplicationsByPeriodParams(siteUrl: 'siteUrl'));

      verify(repository.getTotalOfApplicationsByPeriod('siteUrl'));
      expect(result, Right(jobApplication));
    },
  );
}
