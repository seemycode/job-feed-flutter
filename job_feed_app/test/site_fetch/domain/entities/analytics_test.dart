import 'package:flutter_test/flutter_test.dart';
import 'package:job_feed_app/site_fetch/domain/entities/analytics.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Analytics])
void main() {
  constructorsTesting();
}

void constructorsTesting() {
  test(
    "Should implement a getter 'upgrade_intention' when constructing upgradeIntention",
    () {
      final analytics =
          Analytics.upgradeIntention(siteUrl: 'siteUrl', source: 'source');

      expect(analytics.eventName, 'upgrade_intention');
    },
  );
  test(
    "Should implement a getter 'redirect_to_site' when constructing siteRedirect",
    () {
      final analytics = Analytics.siteRedirect(siteUrl: 'siteUrl');

      expect(analytics.eventName, 'redirect_to_site');
    },
  );
  test(
    "Should implement a getter 'site_fetches_per_user' when constructing numberOfSiteFetches",
    () {
      final analytics =
          Analytics.numberOfSiteFetches(site_fetch_attempt_result: false);

      expect(analytics.eventName, 'site_fetches_per_user');
    },
  );
  test(
    "Should implement a getter 'no_intention_to_upgrade' when constructing noIntentionToUpgrade",
    () {
      final analytics = Analytics.noIntentionToUpgrade(hiddenTimes: 1);

      expect(analytics.eventName, 'no_intention_to_upgrade');
    },
  );
}
