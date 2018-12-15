import "package:test/test.dart";
import 'package:too_good_to_go/feed/json_parser.dart';

void main() {
  const fakeJson =
    """
      [
        {
          "companyName": "Kvickly - Veri (Bager)",
          "coverImage": "https://i.kinja-img.com/gawker-media/image/upload/s--gf7NfpMG--/c_scale,f_auto,fl_progressive,q_80,w_800/ox6m5b5fev1yoifdlnda.jpg",
          "avatarImage": "https://cdn.freebiesupply.com/logos/large/2x/kvickly-logo-png-transparent.png",
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
          "coverImage": "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/766/low-calorie-fruit-1516368847.jpg",
          "avatarImage": "https://cdn.freebiesupply.com/logos/large/2x/kvickly-logo-png-transparent.png",
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
    expect(parseFeedJson(fakeJson).first.companyName, equals('Kvickly - Veri (Bager)'));
  });
}