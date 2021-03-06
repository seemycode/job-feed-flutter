// Mocks generated by Mockito 5.0.15 from annotations
// in job_feed_app/test/site_fetch/domain/usecases/get_total_of_applications_by_period_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:job_feed_app/core/failure.dart' as _i5;
import 'package:job_feed_app/site_fetch/domain/entities/job_application.dart'
    as _i6;
import 'package:job_feed_app/site_fetch/domain/repositories/job_application_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [JobApplicationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockJobApplicationRepository extends _i1.Mock
    implements _i3.JobApplicationRepository {
  MockJobApplicationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.JobApplication>>
      getTotalOfApplicationsByPeriod(String? siteUrl) => (super.noSuchMethod(
              Invocation.method(#getTotalOfApplicationsByPeriod, [siteUrl]),
              returnValue:
                  Future<_i2.Either<_i5.Failure, _i6.JobApplication>>.value(
                      _FakeEither_0<_i5.Failure, _i6.JobApplication>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.JobApplication>>);
  @override
  String toString() => super.toString();
}
