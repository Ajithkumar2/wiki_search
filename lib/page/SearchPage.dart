import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:wiki_search/api/get_data.dart';
import 'package:wiki_search/models/users.dart';
import 'package:wiki_search/page/overview_page.dart';

class SearchPage extends StatefulWidget{
  @override
 _SearchPageState createState()=> _SearchPageState();
}
class _SearchPageState extends State<SearchPage>
{
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(centerTitle:true,title: Text("Wiki Search")),
      body: SafeArea(
       child: Container(
           padding: EdgeInsets.all(16),
           child: TypeAheadField<UserPages>(
             debounceDuration: Duration(microseconds: 2000),
             hideSuggestionsOnKeyboardHide: false,
             textFieldConfiguration: TextFieldConfiguration(
               decoration: InputDecoration(
                 prefixIcon: Icon(Icons.search),
                 border: OutlineInputBorder(),
                 hintText: 'Search here...',
               ),
             ),
             noItemsFoundBuilder: (context) => Container(
               height: 100,
               child: Center(
                 child: Text(
                   'No result Found.',
                   style: TextStyle(fontSize: 24),
                 ),
               ),
             ),
             suggestionsCallback: (pattern) async{
               return await GetData.getQueryData(pattern);
             },
             onSuggestionSelected:(suggestion) {
               Navigator.of(context).push(MaterialPageRoute(
                   builder: (context) => OverViewPage(pageId: suggestion.pageid.toString(), title: suggestion.title)
               ));
             },
             itemBuilder: (context, suggestion) {
               final user = suggestion;

               return ListTile(
                 leading: Container(
                   width: 60,
                   height: 60,
                   child: FadeInImage(
                     placeholder: AssetImage('assets/images/placeholder.png'),
                     image: user.thumbnail == null ? AssetImage('assets/images/default_image.png') : NetworkImage(user.thumbnail.source),),
                 ),
                 title: Text(user.title),
                 subtitle: user.terms == null ? Text("") : Text(user.terms.description[0]),
               );
             },
           ),
         ),
      ),
   );
  }

}