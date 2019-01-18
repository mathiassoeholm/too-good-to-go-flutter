import 'package:url_launcher/url_launcher.dart' as urlLauncher;

/// Providers a class wrapper around url_launcher.dart,
/// such that it can be mocked in tests.
class UrlLauncher {
  Future<void> launch(String urlString) => urlLauncher.launch(urlString);

  Future<bool> canLaunch(String urlString) => urlLauncher.canLaunch(urlString);

  Future<void> closeWebView() => urlLauncher.closeWebView();
}
