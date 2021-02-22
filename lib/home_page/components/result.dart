import 'package:chemkosh/colors.dart';
import 'package:chemkosh/home_page/components/data_tile.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String title;
  final Map<String, dynamic> data;

  const Result({Key key, this.data, this.title}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return widget.data != null
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Expanded(
                child: Container(
                  height: size.height - 250,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: CustomColors.accentColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          widget.title,
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/smiles/${Uri.encodeComponent(widget.title)}/PNG',
                            ),
                          ),
                        ),
                        DataTile(
                          title: 'Molecular formula',
                          body: widget.data['MolecularFormula'],
                        ),
                        DataTile(
                          title: 'Molecular Weight',
                          body: '${widget.data['ExactMass']} g/mol',
                        ),
                        DataTile(
                          title: 'H bonds donor',
                          body: widget.data['HBondDonorCount'].toString(),
                        ),
                        DataTile(
                          title: 'H bonds acceptor',
                          body: widget.data['HBondAcceptorCount'].toString(),
                        ),
                        DataTile(
                          title: 'IUPAC Name',
                          body: widget.data['IUPACName'],
                        ),
                        DataTile(
                          title: 'Non H atoms',
                          body: widget.data['HeavyAtomCount'].toString(),
                        ),
                        DataTile(
                          title: 'Isotope atoms',
                          body: widget.data['IsotopeAtomCount'].toString(),
                        ),
                        DataTile(
                          title: 'Rotatable bonds',
                          body: widget.data['RotatableBondCount'].toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : Expanded(
            child: Center(
              child: Text(
                'You have not searched\nanything yet',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
