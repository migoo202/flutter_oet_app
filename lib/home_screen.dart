import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: SafeArea(
        child: WebView(
          initialUrl: 'https://oet2.com/?fbclid=IwAR1MII4ZIKblDG4B2dpK3yfi8nP8vHOMdV5h8WE30kkE0HIFa553KLEwefw',
          javascriptMode: JavascriptMode.unrestricted,
          userAgent:'Mozilla/5.0 (Linux; Android 4.4.4; One Build/KTU84L.H4) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36 [FB_IAB/FB4A;FBAV/28.0.0.20.16;]' ,
         //to control in your website like go to next page and bake again

          onWebViewCreated: (WebViewController webViewController) {
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(webViewController);
          },
        ),
      ),
    );
  }
//ask you before exit your app
  Future<bool> _goBack(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Do you want to exit'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text('Yes'),
              ),
            ],
          ));
      return Future.value(true);
    }
  }
}

