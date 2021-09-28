import 'package:flutter/material.dart';
// import 'package:pupan_se/search_widget.dart';
import './network.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<SearchList> {
  String searchString = "";
  List<String> stringList;
  List<dynamic> _postsDisplay;
  bool _isLoading = true;

  List<dynamic> _servicesList = [];

  @override
  void initState() {
    fetchPost().then((value) {
      print(value.length);

      setState(() {
        _isLoading = false;

        _servicesList.addAll(value);

        _postsDisplay = _servicesList;
        print(_postsDisplay);
      });
    });
    super.initState();

    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pupan Test Flutter"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (!_isLoading) {
            return index == 0 ? _searchData() : _listItem(index - 1);
            // return _listItem(index);
          } else {
            return Center(child: CircularProgressIndicator());
          }
          // List<dynamic> stringList = snapshot.data;
        },
        itemCount: _servicesList.length,
      ),
    );
  }

  _searchData() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextField(
          decoration: InputDecoration(hintText: 'Search ...'),
          onChanged: (text) {
            text = text.toLowerCase();

            setState(() {
              _servicesList = _postsDisplay.where((post) {
                var element = post.toLowerCase();

                return element.contains(text);
              }).toList();
            });
          },
        ));
  }

  _listItem(index) {
    print("list item on");
    return Card(
        child: Padding(
      padding: EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_servicesList[index],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    ));
  }
}
