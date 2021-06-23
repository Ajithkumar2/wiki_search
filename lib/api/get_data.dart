import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:wiki_search/models/userpage.dart';
import 'package:wiki_search/models/users.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class GetData
{
  static Future<List<UserPages>> getQueryData(String query) async {
    final url = Uri.parse(
        'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=' +
            query + '&gpslimit=10');
    bool networkStatus = await check();
    String fileName = "userQueryData.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);
    if (networkStatus) {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var data1 = Users.fromJson(data);
      //storing to cache file
      file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
      return data1.query.pages;
    }
    else {
      throw Exception();
    }
    }
    else {
      if(file.existsSync())
        {
          var stringData = file.readAsStringSync();
          var data = json.decode(stringData);
          var data1 = Users.fromJson(data);
          return data1.query.pages;
        }
      else
        return null;

    }
  }
  static Future<String> getPageLink(String pageid) async{
    final url = Uri.parse("https://en.wikipedia.org/w/api.php?action=query&prop=info&inprop=url&format=json&pageids="+pageid);
    bool networkStatus = await check();
    String fileName = "userPageData.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);
    if (networkStatus) {
      final response = await http.get(url);
      if(response.statusCode == 200)
      {
        var data = json.decode(response.body);
        var data1 = UserPage.fromJson(data, pageid);
        return data1.query.pages.pageLinkDetails.fullurl.toString();
      }
    }
    else {
      if (file.existsSync()) {
        var stringData = file.readAsStringSync();
        var data = json.decode(stringData);
        var data1 = UserPage.fromJson(data, pageid);
        return data1.query.pages.pageLinkDetails.fullurl.toString();
      }
      else
        return "empty";
    }

  }
  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}