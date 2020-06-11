
//import 'dart:async';
//
//import 'package:flutter/material.dart';
//
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
////Future main() async {
////  runApp(new MyApp());
////}
//
//class MyApp11 extends StatefulWidget {
//  @override
//  _MyApp11State createState() => new _MyApp11State();
//}
//
//class _MyApp11State extends State<MyApp11> {
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: InAppWebViewPage()
//    );
//  }
//}
//
//class InAppWebViewPage extends StatefulWidget {
//  @override
//  _InAppWebViewPageState createState() => new _InAppWebViewPageState();
//}
//
//class _InAppWebViewPageState extends State<InAppWebViewPage> {
//  InAppWebViewController webView;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//            title: Text("InAppWebView")
//        ),
//        body: Container(
//            child: Column(children: <Widget>[
//              Expanded(
//                child: Container(
//                  child: InAppWebView(
//                    initialUrl: "https://www.youtube.com/embed/IyFZznAk69U",
//                    initialHeaders: {},
//                    initialOptions: InAppWebViewWidgetOptions(
//                      inAppWebViewOptions: InAppWebViewOptions(
//                        debuggingEnabled: true,
//                      ),
//                    ),
//                    onWebViewCreated: (InAppWebViewController controller) {
//                      webView = controller;
//                    },
//                    onLoadStart: (InAppWebViewController controller, String url) {
//
//                    },
//                    onLoadStop: (InAppWebViewController controller, String url) {
//
//                    },
//                  ),
//                ),
//              ),
//            ]))
//    );
//  }
//}