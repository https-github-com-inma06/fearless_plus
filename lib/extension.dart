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
        forceSafariVC: true, // iOS 인앱 여부
        forceWebView: true, // Android 인앱 여부
        enableJavaScript: true, // javascript 페이지 활성화

        // headers: <String, String>{'my_header_key': 'my_header_value'},
      );
      Log().trace("launchInBrowser Success: $url");
    } else {
      // throw 'Could not launch $url';
      Log().trace("launchInBrowser Fail: $url");
    }
  }
}
