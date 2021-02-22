import 'dart:convert';

import 'package:chemkosh/home_page/components/result.dart';
import 'package:chemkosh/home_page/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchData = '';
  Map<String, dynamic> data;
  String title;

  String url =
      'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/smiles/input/property/ExactMass,MolecularFormula,HBondDonorCount,HBondAcceptorCount,IUPACName,HeavyAtomCount,IsotopeAtomCount,RotatableBondCount/JSON';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            onChanged: (value) => searchData = value,
            onSubmit: () async {
              if (searchData != '') {
                Response response = await get(url.replaceAll('input', Uri.encodeComponent(searchData)));
                var data = jsonDecode(response.body);

                setState(() {
                  this.data = data['PropertyTable']['Properties'][0];
                  title = searchData;
                });
              }
            },
          ),
          Result(title: title, data: data),
        ],
      ),
    );
  }
}
