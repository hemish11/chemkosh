import 'package:chemkosh/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final GestureTapCallback onSubmit;

  const SearchBar({Key key, this.onChanged, this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Container(
        height: 150,
        width: size.width,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: CustomColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('ChemKosh', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
            Container(
              height: 60,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: CustomColors.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none, hintText: 'Search'),
                        style: TextStyle(fontSize: 20),
                        cursorColor: CustomColors.primaryColor,
                        onChanged: onChanged,
                        onSubmitted: (value) {
                          onSubmit();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Material(
                      color: CustomColors.transparent,
                      child: InkWell(
                        onTap: onSubmit,
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(height: 40, width: 40, child: Icon(Icons.search, size: 28)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
