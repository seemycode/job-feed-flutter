import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_board.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/job_board_repository.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';
import 'package:job_feed_app/site_fetch/domain/usecases/get_job_boards_of_a_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_job_boards_of_a_user_test.mocks.dart';

@GenerateMocks([JobBoardRepository, UserRepository])
void main() {
  late MockJobBoardRepository jobBoardRepository;
  late MockUserRepository userRepository;
  late GetJobBoardsOfAUser usecase;

  setUp(() {
    jobBoardRepository = MockJobBoardRepository();
    userRepository = MockUserRepository();
    usecase = GetJobBoardsOfAUser(jobBoardRepository, userRepository);
  });

  final jobBoards = [
    JobBoard(siteName: 'siteName', siteLogo: 'siteLogo', siteUrl: 'siteUrl')
  ];
  test(
    "Should get job boards from repository",
    () async {
      when(jobBoardRepository.getJobBoardsOfAUser())
          .thenAnswer((_) async => Right(jobBoards));

      final results = await usecase(NoParams());

      verify(jobBoardRepository.getJobBoardsOfAUser());
      expect(results, Right(jobBoards));
    },
  );

//TODO: "Should attribute default job board icon when no site logo doesn't exist" > Data
  //TODO: "Should add a promotional banner item when user is freemium" > Presentation
}
