import 'dart:convert';

abstract class Analytics {
  String get eventName;
  Map<String, dynamic> toMap();
  String toJson();

  factory Analytics.upgradeIntention(
      {required String siteUrl,
      required String source}) = _AnalyticsUpgradeIntention;
  factory Analytics.siteRedirect({required String siteUrl}) =
      _AnalyticsSiteRedirect;
  factory Analytics.numberOfSiteFetches(
          {required bool site_fetch_attempt_result}) =
      _AnalyticsNumberOfSiteFetches;
  factory Analytics.noIntentionToUpgrade({required int hiddenTimes}) =
      _AnalyticsNoIntentionToUpgrade;
}

class _AnalyticsUpgradeIntention implements Analytics {
  final String siteUrl;
  final String source;
  _AnalyticsUpgradeIntention({
    required this.siteUrl,
    required this.source,
  });

  @override
  String get eventName => 'upgrade_intention';

  Map<String, dynamic> toMap() {
    return {
      'siteUrl': siteUrl,
      'source': source,
    };
  }

  String toJson() => json.encode(toMap());
}

class _AnalyticsSiteRedirect implements Analytics {
  final String siteUrl;
  _AnalyticsSiteRedirect({
    required this.siteUrl,
  });

  @override
  String get eventName => 'redirect_to_site';

  Map<String, dynamic> toMap() {
    return {
      'siteUrl': siteUrl,
    };
  }

  String toJson() => json.encode(toMap());
}

class _AnalyticsNumberOfSiteFetches implements Analytics {
  final bool site_fetch_attempt_result;
  _AnalyticsNumberOfSiteFetches({
    required this.site_fetch_attempt_result,
  });

  @override
  String get eventName => 'site_fetches_per_user';

  Map<String, dynamic> toMap() {
    return {
      'site_fetch_attempt_result': site_fetch_attempt_result,
    };
  }

  String toJson() => json.encode(toMap());
}

class _AnalyticsNoIntentionToUpgrade implements Analytics {
  final int hiddenTimes;
  _AnalyticsNoIntentionToUpgrade({
    required this.hiddenTimes,
  });

  @override
  String get eventName => 'no_intention_to_upgrade';

  Map<String, dynamic> toMap() {
    return {
      'hiddenTimes': hiddenTimes,
    };
  }

  String toJson() => json.encode(toMap());
}
