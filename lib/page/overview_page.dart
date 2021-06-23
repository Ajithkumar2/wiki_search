import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:wiki_search/api/get_data.dart';
import 'package:webview_flutter/webview_flutter.dart';


class OverViewPage extends StatefulWidget
{
  final String url="";
  final String pageId;
  final String title;
  OverViewPage({Key key, @required this.pageId, @required this.title}): super(key: key);
@override
_OverViewPageState createState() => _OverViewPageState();
}
class _OverViewPageState extends State<OverViewPage>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: SafeArea(
          left: false,
          right: false,
          top: false,
          bottom: false,
          child: FutureBuilder<String>(
              future: GetData.getPageLink(widget.pageId),
              builder: (context,snapshot)  {
                if(snapshot.hasData)
                {
                  if(snapshot.data == "empty")
                    {
                      return Text("Check your internet connection.");
                    }
                  return WebView(initialUrl: snapshot.data,);
                }
                else
                  {
                    return Text("Loading please wait....");
                  }
              }),
        ),
      ),
    );
  }
}