import 'dart:convert';

import 'package:equatable/equatable.dart';

class JobBoard extends Equatable {
  final String siteName;
  final String siteLogo;
  final String siteUrl;
  JobBoard({
    required this.siteName,
    required this.siteLogo,
    required this.siteUrl,
  });

  @override
  String toString() =>
      'JobBoard(siteName: $siteName, siteLogo: $siteLogo, siteUrl: $siteUrl)';

  @override
  List<Object> get props => [siteName, siteLogo, siteUrl];
}
