import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutDeveloperPage extends StatelessWidget {
  const AboutDeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: ColorConfig.red,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const Text("ABOUT DEVELOPER"),
        centerTitle: true,
      ),
      body: const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://hafizarrahman.com/",
      ),
    );
  }
}
