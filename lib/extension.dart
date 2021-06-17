import 'package:device_apps/device_apps.dart';
import 'package:url_launcher/url_launcher.dart';

class Log {
  void trace(dynamic log) {
    print("TRACE :: $log");
  }
}

class DeviceApps {
  Future<bool> isInstalled(String packageName) async {
    bool isInstalled = await DeviceApps().isInstalled("$packageName");
    return isInstalled;
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
