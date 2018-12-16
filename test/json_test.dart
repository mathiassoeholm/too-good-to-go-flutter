import "package:test/test.dart";
import 'package:too_good_to_go/feed/json_parser.dart';
import 'package:too_good_to_go/feed/models/feed_item.dart';

void main() {
  const fakeJson =
    """
      [
        {
          "companyName": "Kvickly - Veri (Bager)",
          "coverImage": "cover-image-url-0",
          "avatarImage": "avatar-image-url-0",
          "location": {
            "lat" : 37.4224764,
            "lng" : -122.0842499
          },
          "itemsLeft": 5,
          "price": {
            "dkk": 39
          },
          "timeStart": "16:45",
          "timeEnd": "17:00",
          "favorites": 219
        },
        {
          "companyName": "Kvickly - Veri (frugt og grønt)",
          "coverImage": "cover-image-url-1",
          "avatarImage": "avatar-image-url-1",
          "location": {
            "lat" : 37.4224764,
            "lng" : -122.0842499
          },
          "itemsLeft": 5,
          "price": {
            "dkk": 39
          },
          "timeStart": "16:45",
          "timeEnd": "17:00",
          "favorites": 219
        }
      ]
    """;

  test("Parse json", () {
    FeedItem item = parseFeedJson(fakeJson).first;
    expect(item.companyName, equals('Kvickly - Veri (Bager)'));
    expect(item.coverImage, equals('cover-image-url-0'));
    expect(item.avatarImage, equals('avatar-image-url-0'));
    expect(item.location.lat, equals(37.4224764));
    expect(item.location.lng, equals(-122.0842499));
    expect(item.itemsLeft, 5);
    expect(item.price['dkk'], 39);
    expect(item.timeStart, '16:45');
    expect(item.timeEnd, '17:00');
    expect(item.favorites, 219);

    expect(parseFeedJson(fakeJson)[1].companyName, equals('Kvickly - Veri (frugt og grønt)'));
  });
}