import 'package:url_launcher/url_launcher.dart';

class Extension {
  void trace(dynamic log) {
    print("TRACE :: $log");
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
      trace("launchInBrowser Success: $url");
    } else {
      // throw 'Could not launch $url';
      trace("launchInBrowser Fail: $url");
    }
  }
}
