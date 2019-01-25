import 'package:http/http.dart' as http;
import 'package:too_good_to_go/feed/json_parser.dart';
import 'package:too_good_to_go/feed/submodels/feed_item.dart';

class FeedService {
  final http.BaseClient httpClient;

  const FeedService({
    this.httpClient,
  });

  Future<List<FeedItem>> getFeed() async {
    final response = await httpClient.get('http://not-a-real-api.com/toogoodtogo/feed');

    if (response.statusCode == 200) {
      try {
        return parseFeedJson(response.body);
      } catch (error) {
        return [];
      }
    } else {
      return [];
    }
  }
}