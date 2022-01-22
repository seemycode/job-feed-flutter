import 'package:dartz/dartz.dart';
import 'package:job_feed_app/core/failure.dart';
import 'package:job_feed_app/core/noparams.dart';
import 'package:job_feed_app/core/usecase.dart';
import 'package:job_feed_app/site_fetch/domain/entities/job_board.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/job_board_repository.dart';
import 'package:job_feed_app/site_fetch/domain/repositories/user_repository.dart';

class GetJobBoardsOfAUser extends UseCase<List<JobBoard>, NoParams> {
  final JobBoardRepository jobBoardRepository;
  final UserRepository userRepository;

  GetJobBoardsOfAUser(this.jobBoardRepository, this.userRepository);

  @override
  Future<Either<Failure, List<JobBoard>>> call(params) {
    // final userPlan = userRepository.getUserPlan();

    return jobBoardRepository.getJobBoardsOfAUser();
  }
}
