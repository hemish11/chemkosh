import 'dart:convert';

import 'package:chemkosh/colors.dart';
import 'package:chemkosh/home_page/components/result.dart';
import 'package:chemkosh/home_page/components/search_bar.dart';
import 'package:chemkosh/home_page/components/wiki_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchData = '';
  String data;
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Result(title: title, data: data),
          WikiButton(hasData: true, title: title),
          SearchBar(
            onChanged: (value) => searchData = value,
            onSubmit: () async {
              if (searchData != '') {
                String url =
                    'https://en.wikipedia.org/w/api.php?action=query&prop=extracts&format=json&exintro=&titles=';

                Response response = await get(url + searchData);
                var data = jsonDecode(response.body);

                setState(() {
                  this.data = data['query']['pages'].values.toList()[0]['extract'];
                  title = data['query']['pages'].values.toList()[0]['title'];
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
