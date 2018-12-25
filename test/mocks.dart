import 'package:mockito/mockito.dart';
import 'package:too_good_to_go/feed/feed_bloc.dart';
import 'package:too_good_to_go/feed/feed_service.dart';
import 'package:location/location.dart';

class MockFeedService extends Mock implements FeedService { }
class MockFeedBloc extends Mock implements FeedBloc { }
class MockLocation extends Mock implements Location {}