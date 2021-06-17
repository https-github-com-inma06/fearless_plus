import 'package:url_launcher/url_launcher.dart';

class Log {
  void trace(dynamic log) {
    print("TRACE :: $log");
  }
}

class LaunchInBrowser {
  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
      Log().trace("launchInBrowser Success: $url");
    } else {
      // throw 'Could not launch $url';
      Log().trace("launchInBrowser Fail: $url");
    }
  }
}
