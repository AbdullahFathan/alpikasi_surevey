import 'package:flutter/material.dart';
import 'package:kuisoner_app/screen/berhasil_isi_kuisoner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GformWebView extends StatefulWidget {
  String urlGfrom;
  GformWebView({
    Key? key,
    required this.urlGfrom,
  }) : super(key: key);

  @override
  State<GformWebView> createState() => _GformWebViewState();
}

class _GformWebViewState extends State<GformWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: widget.urlGfrom,
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (url) {
            if (url.contains("formResponse")) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => BerhasilIsiKuisonerPage()));
            }
          },
        ),
      ),
    );
  }
}
