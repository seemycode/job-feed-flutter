// Mocks generated by Mockito 5.0.15 from annotations
// in job_feed_app/test/site_fetch/domain/usecases/get_site_fetch_previous_stats_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:job_feed_app/core/failure.dart' as _i5;
import 'package:job_feed_app/site_fetch/domain/entities/site_fetch.dart' as _i6;
import 'package:job_feed_app/site_fetch/domain/repositories/site_fetch_repository.dart'
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

/// A class which mocks [SiteFetchRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockSiteFetchRepository extends _i1.Mock
    implements _i3.SiteFetchRepository {
  MockSiteFetchRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SiteFetch>> getSiteFetchLastStats(
          {String? siteUrl}) =>
      (super.noSuchMethod(
          Invocation.method(#getSiteFetchLastStats, [], {#siteUrl: siteUrl}),
          returnValue: Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>.value(
              _FakeEither_0<_i5.Failure, _i6.SiteFetch>())) as _i4
          .Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SiteFetch>> getSiteFetchPreviousStats(
          {String? siteUrl}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #getSiteFetchPreviousStats, [], {#siteUrl: siteUrl}),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>.value(
                  _FakeEither_0<_i5.Failure, _i6.SiteFetch>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>
      getTodaysSiteFetchCount() => (super.noSuchMethod(
              Invocation.method(#getTodaysSiteFetchCount, []),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>.value(
                  _FakeEither_0<_i5.Failure, _i6.SiteFetch>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.SiteFetch>>);
  @override
  String toString() => super.toString();
}
